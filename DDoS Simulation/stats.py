import codecs

dics = []
count = 0

with codecs.open("out.tr", "r", "UTF8") as inputFile:
    inputFile=inputFile.readlines()
for line in inputFile:
    item = line.split(" ");

    line_dic = {}

    line_dic['event'] = item[0]
    line_dic['time'] = item[1]
    line_dic['from_node'] = item[2]
    line_dic['to_node'] = item[3]
    line_dic['pkt_type'] = item[4]
    line_dic['pkt_size'] = item[5]
    line_dic['flags'] = item[6]
    line_dic['fid'] = item[7]
    line_dic['source'] = item[8]
    line_dic['dest'] = item[9]
    line_dic['seqnum'] = item[10]
    line_dic['pkti'] = item[11]

    dics.append(line_dic)

usertraffic = []
bottraffic = []
receiveduser = []
droppeduser = []
droppedbot = []
receivedbot = []

for items in dics:
    if (items['dest']=='29.0'):
        usertraffic.append(items)
    if (items['dest']=='30.0' or '31.0' or '32.0'):
        bottraffic.append(items)
print("Finished Initial")

for each in usertraffic:
    if (each['event']=='d'):
        droppeduser.append(each)
    if (each['event']=='r'):
        receiveduser.append(each)   
print("Finished User Analysis")

for each in bottraffic:
    if (each['event']=='d'):
        droppedbot.append(each)
    if (each['event']=='r'):
        receivedbot.append(each)
print("Finished Bot Analysis")


userdropperc = len(droppeduser)/len(receiveduser)
botdropperc = len(droppedbot)/len(receivedbot)

print("\nTraffic Analysis:")
print("User Drop Percentage:", round(userdropperc, 2))
print("Bot Drop Percentage:", round(botdropperc, 2))
print("Total Trace Size:", len(dics))
print("User Traffic Size:", len(usertraffic))
print("Total Received User Traffic Size:", len(receiveduser))
print("Total Dropped User Traffic Size:", len(droppeduser))

