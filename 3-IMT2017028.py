# program to convert mips code to binary instructions

from collections import defaultdict
d = defaultdict(str)
d["s0"] = "01000"
d["s1"] = "01001"
d["s2"] = "01010"
d["s3"] = "01011"
d["s4"] = "01100"
d["s5"] = "01101"
d["s6"] = "01110"
d["s7"] = "01111"
d["t0"] = "10000"
d["t1"] = "10001"
d["t2"] = "10010"
d["t3"] = "10011"
d["t4"] = "10100"
d["t5"] = "10101"
d["t6"] = "10110"
d["t7"] = "10111"
d["r0"] = "00000"
d["lw"] = "011100"
d["r"] = "000000"
d["sw"] = "011101"

al=[]


while(True):
	ans = ""
	ins=raw_input()
	if(ins == "End") :
		break


	l = ins.split(" ")
	rs = l[2]
	rd = l[1]
	rt = l[3]
	if(l[0]=="lw"):
		ans+=d["lw"]
		ans+=d[rs]
		ans+=d[rd]
		ans+=("0"*(max(16-len(bin(int(rt))[2:]),0)))+bin(int(rt))[2:]
		# ans+=d[rt]

	elif(l[0] == "sw"):
		ans+=d["sw"]
		ans+=d[rs]
		ans+=d[rd]
		ans+=("0"*(max(16-len(bin(int(rt))[2:]),0)))+bin(int(rt))[2:]

	else :
		ans+=d["r"]
		ans+=d[rs]
		ans+=d[rd]
		ans+=d[rt]
		if(l[0]=="mul"):ans+="00000111111"
		elif(l[0]=="add"):ans+="00000100000"
		# print rs,rd,rt
	# print ans
	al.append(ans)

with open('instruction', 'w') as f:
	for i in al:
		# print i	
		f.write(i + "\n")

f.close()