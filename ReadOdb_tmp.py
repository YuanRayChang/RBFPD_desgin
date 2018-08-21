import cmath
import operator
import csv
import os
from odbAccess import *

def find(seq, target):
    for i, value in enumerate(seq):
        if value == target:
            break
    else:
        return -1
    return i

def find2(seq, target):
    ind = []
    for i, value in enumerate(seq):
        if value == target:
            ind.append(i)
    if (len(ind) < 1):
        ind.append(-1)
    return ind

class MyNode():
    def __init__(self, label, data, coor):
        self.label = label
        self.data = data
        self.x = coor[0]
        self.y = coor[1]
        self.z = coor[2]

class MyElement():
    def __init__(self, node1, node2, node3, threshold):
        self.node1 = node1
        self.node2 = node2
        self.node3 = node3
        self.threshold = threshold
    def calc_area_n(self):
        if self.node3.data > self.threshold:
            return 0
        elif (self.node2.data > self.threshold) and (self.node3.data <= self.threshold):
            mid1 = MyNode(0,0,[0,0,0])
            mid1.x = self.node3.x +float(self.node3.data-self.threshold)/(self.node3.data-self.node1.data)*(self.node1.x-self.node3.x)
            mid1.y = self.node3.y +float(self.node3.data-self.threshold)/(self.node3.data-self.node1.data)*(self.node1.y-self.node3.y)
            mid1.z = self.node3.z +float(self.node3.data-self.threshold)/(self.node3.data-self.node1.data)*(self.node1.z-self.node3.z)
            mid2 = MyNode(0,0,[0,0,0])
            mid2.x = self.node3.x +float(self.node3.data-self.threshold)/(self.node3.data-self.node2.data)*(self.node2.x-self.node3.x)
            mid2.y = self.node3.y +float(self.node3.data-self.threshold)/(self.node3.data-self.node2.data)*(self.node2.y-self.node3.y)
            mid2.z = self.node3.z +float(self.node3.data-self.threshold)/(self.node3.data-self.node2.data)*(self.node2.z-self.node3.z)
            sqlen1 = (self.node3.x - mid1.x)**2 + (self.node3.y - mid1.y)**2 + (self.node3.z - mid1.z)**2
            sqlen2 = (self.node3.x - mid2.x)**2 + (self.node3.y - mid2.y)**2 + (self.node3.z - mid2.z)**2
            area = 0.5*cmath.sqrt(sqlen1*sqlen2 - ((mid1.x-self.node3.x)*(mid2.x-self.node3.x) + \
                                                   (mid1.y-self.node3.y)*(mid2.y-self.node3.y) + \
                                                   (mid1.z-self.node3.z)*(mid2.z-self.node3.z))**2)
            return area
        elif (self.node1.data <= self.threshold):
            sqlen1 = (self.node3.x - self.node1.x)**2 + (self.node3.y - self.node1.y)**2 + (self.node3.z - self.node1.z)**2
            sqlen2 = (self.node3.x - self.node2.x)**2 + (self.node3.y - self.node2.y)**2 + (self.node3.z - self.node2.z)**2
            area = 0.5*cmath.sqrt(sqlen1*sqlen2 - ((self.node1.x-self.node3.x)*(self.node2.x-self.node3.x) + \
                                                   (self.node1.y-self.node3.y)*(self.node2.y-self.node3.y) + \
                                                   (self.node1.z-self.node3.z)*(self.node2.z-self.node3.z))**2)
            return area
        else:
            mid1 = MyNode(0,0,[0,0,0])
            mid1.x = self.node3.x +float(self.node3.data-self.threshold)/(self.node3.data-self.node1.data)*(self.node1.x-self.node3.x)
            mid1.y = self.node3.y +float(self.node3.data-self.threshold)/(self.node3.data-self.node1.data)*(self.node1.y-self.node3.y)
            mid1.z = self.node3.z +float(self.node3.data-self.threshold)/(self.node3.data-self.node1.data)*(self.node1.z-self.node3.z)
            mid2 = MyNode(0,0,[0,0,0])
            mid2.x = self.node2.x +float(self.node2.data-self.threshold)/(self.node2.data-self.node1.data)*(self.node1.x-self.node2.x)
            mid2.y = self.node2.y +float(self.node2.data-self.threshold)/(self.node2.data-self.node1.data)*(self.node1.y-self.node2.y)
            mid2.z = self.node2.z +float(self.node2.data-self.threshold)/(self.node2.data-self.node1.data)*(self.node1.z-self.node2.z)
            sqlen1 = (mid2.x-self.node2.x)**2 + (mid2.y-self.node2.y)**2 + (mid2.z-self.node2.z)**2
            sqlen2 = (mid2.x-self.node3.x)**2 + (mid2.y-self.node3.y)**2 + (mid2.z-self.node3.z)**2
            area1 = 0.5*cmath.sqrt(sqlen1*sqlen2 - ((self.node2.x-mid2.x)*(self.node3.x-mid2.x) + \
                                                   (self.node2.y-mid2.y)*(self.node3.y-mid2.y) + \
                                                   (self.node2.z-mid2.z)*(self.node3.z-mid2.z))**2)
            sqlen3 = (self.node3.x-mid1.x)**2 + (self.node3.y-mid1.y)**2 + (self.node3.z-mid1.z)**2
            sqlen4 = (self.node3.x-mid2.x)**2 + (self.node3.y-mid2.y)**2 + (self.node3.z-mid2.z)**2
            area2 = 0.5*cmath.sqrt(sqlen3*sqlen4 - ((mid2.x-self.node3.x)*(mid1.x-self.node3.x) + \
                                                   (mid2.y-self.node3.y)*(mid1.y-self.node3.y) + \
                                                   (mid2.z-self.node3.z)*(mid1.z-self.node3.z))**2)
            return area1+area2
    def calc_area_p(self):
        if self.node3.data < self.threshold:
            return 0
        elif (self.node2.data < self.threshold) and (self.node3.data >= self.threshold):
            mid1 = MyNode(0,0,[0,0,0])
            mid1.x = self.node3.x +float(self.node3.data-self.threshold)/(self.node3.data-self.node1.data)*(self.node1.x-self.node3.x)
            mid1.y = self.node3.y +float(self.node3.data-self.threshold)/(self.node3.data-self.node1.data)*(self.node1.y-self.node3.y)
            mid1.z = self.node3.z +float(self.node3.data-self.threshold)/(self.node3.data-self.node1.data)*(self.node1.z-self.node3.z)
            mid2 = MyNode(0,0,[0,0,0])
            mid2.x = self.node3.x +float(self.node3.data-self.threshold)/(self.node3.data-self.node2.data)*(self.node2.x-self.node3.x)
            mid2.y = self.node3.y +float(self.node3.data-self.threshold)/(self.node3.data-self.node2.data)*(self.node2.y-self.node3.y)
            mid2.z = self.node3.z +float(self.node3.data-self.threshold)/(self.node3.data-self.node2.data)*(self.node2.z-self.node3.z)
            sqlen1 = (self.node3.x - mid1.x)**2 + (self.node3.y - mid1.y)**2 + (self.node3.z - mid1.z)**2
            sqlen2 = (self.node3.x - mid2.x)**2 + (self.node3.y - mid2.y)**2 + (self.node3.z - mid2.z)**2
            area = 0.5*cmath.sqrt(sqlen1*sqlen2 - ((mid1.x-self.node3.x)*(mid2.x-self.node3.x) + \
                                                   (mid1.y-self.node3.y)*(mid2.y-self.node3.y) + \
                                                   (mid1.z-self.node3.z)*(mid2.z-self.node3.z))**2)
            return area
        elif (self.node1.data >= self.threshold):
            sqlen1 = (self.node3.x - self.node1.x)**2 + (self.node3.y - self.node1.y)**2 + (self.node3.z - self.node1.z)**2
            sqlen2 = (self.node3.x - self.node2.x)**2 + (self.node3.y - self.node2.y)**2 + (self.node3.z - self.node2.z)**2
            area = 0.5*cmath.sqrt(sqlen1*sqlen2 - ((self.node1.x-self.node3.x)*(self.node2.x-self.node3.x) + \
                                                   (self.node1.y-self.node3.y)*(self.node2.y-self.node3.y) + \
                                                   (self.node1.z-self.node3.z)*(self.node2.z-self.node3.z))**2)
            return area
        else:
            mid1 = MyNode(0,0,[0,0,0])
            mid1.x = self.node3.x +float(self.node3.data-self.threshold)/(self.node3.data-self.node1.data)*(self.node1.x-self.node3.x)
            mid1.y = self.node3.y +float(self.node3.data-self.threshold)/(self.node3.data-self.node1.data)*(self.node1.y-self.node3.y)
            mid1.z = self.node3.z +float(self.node3.data-self.threshold)/(self.node3.data-self.node1.data)*(self.node1.z-self.node3.z)
            mid2 = MyNode(0,0,[0,0,0])
            mid2.x = self.node2.x +float(self.node2.data-self.threshold)/(self.node2.data-self.node1.data)*(self.node1.x-self.node2.x)
            mid2.y = self.node2.y +float(self.node2.data-self.threshold)/(self.node2.data-self.node1.data)*(self.node1.y-self.node2.y)
            mid2.z = self.node2.z +float(self.node2.data-self.threshold)/(self.node2.data-self.node1.data)*(self.node1.z-self.node2.z)
            sqlen1 = (mid2.x-self.node2.x)**2 + (mid2.y-self.node2.y)**2 + (mid2.z-self.node2.z)**2
            sqlen2 = (mid2.x-self.node3.x)**2 + (mid2.y-self.node3.y)**2 + (mid2.z-self.node3.z)**2
            area1 = 0.5*cmath.sqrt(sqlen1*sqlen2 - ((self.node2.x-mid2.x)*(self.node3.x-mid2.x) + \
                                                   (self.node2.y-mid2.y)*(self.node3.y-mid2.y) + \
                                                   (self.node2.z-mid2.z)*(self.node3.z-mid2.z))**2)
            sqlen3 = (self.node3.x-mid1.x)**2 + (self.node3.y-mid1.y)**2 + (self.node3.z-mid1.z)**2
            sqlen4 = (self.node3.x-mid2.x)**2 + (self.node3.y-mid2.y)**2 + (self.node3.z-mid2.z)**2
            area2 = 0.5*cmath.sqrt(sqlen3*sqlen4 - ((mid2.x-self.node3.x)*(mid1.x-self.node3.x) + \
                                                   (mid2.y-self.node3.y)*(mid1.y-self.node3.y) + \
                                                   (mid2.z-self.node3.z)*(mid1.z-self.node3.z))**2)
            return area1+area2

threshold_enamel_press = -17 #-33
threshold_enamel_shear = 19 #35
#threshold_dentine_press = -17 #-17
#threshold_dentine_shear = 25 #25

directory_path = os.getcwd()
csv_path = directory_path+ '/area.csv'
with open(csv_path, 'wb') as csvfile:
    spamwriter = csv.writer(csvfile,delimiter=',',quotechar=',', quoting=csv.QUOTE_MINIMAL)
    #spamwriter.writerow(['particle_number','Total_Area'])
    odbPath = 'E:/cantilever_PMMA_3/odb/34_40.odb'
    print odbPath
    odb = openOdb(odbPath)
    assembly= odb.rootAssembly
    instances = odb.rootAssembly.instances['PART-1-1']
    lastFrame = odb.steps['Step-1'].frames[-1]
    cpress = lastFrame.fieldOutputs['CPRESS']
    cshear1 = lastFrame.fieldOutputs['CSHEAR1']
    cshear2 = lastFrame.fieldOutputs['CSHEAR2']
    n_resin0 = instances.nodeSets['RESIN0']
    
    s_resin0 = assembly.surfaces['S:RESIN_3D'] #enamel

    nodes0_indList = []
    MyNodeList0_cp = []
    MyNodeList0_cs1 = []
    MyNodeList0_cs2 = []

    #==================================================================================
    ############       calculation for the S:resin_3D   (enamel)   #################
    #==================================================================================
    print '======================  start  resin0 ========================='     
    #calculation for the S:resin_3D
    cpress_0 = cpress.getSubset(position=NODAL,region=n_resin0)
    cshear1_0 = cshear1.getSubset(position=NODAL,region=n_resin0)
    cshear2_0 = cshear2.getSubset(position=NODAL,region=n_resin0)
    nodes0_cpr_all = []
    nodes0_cs1_all = []
    nodes0_cs2_all = []
    nodes0_cpr_ind_all = []
    nodes0_cs1_ind_all = []
    nodes0_cs2_ind_all = []
    nodes0_cpr = []
    nodes0_cs1 = []
    nodes0_cs2 = []
    for i in cpress_0.values:
        nodes0_cpr_ind_all.append(i.nodeLabel)
        nodes0_cpr_all.append(i.data)

    for i in cshear1_0.values:
        nodes0_cs1_ind_all.append(i.nodeLabel)
        nodes0_cs1_all.append(i.data)

    for i in cshear2_0.values:
        nodes0_cs2_ind_all.append(i.nodeLabel)
        nodes0_cs2_all.append(i.data)

    for i in range(len(n_resin0.nodes)):
        find_result = find2(nodes0_cpr_ind_all, n_resin0.nodes[i].label)
        if (len(find_result) == 1):
            if (find_result == -1):
                pass
            else:
                nodes0_cpr.append(nodes0_cpr_all[find_result[0]])
        else:
            a = nodes0_cpr_all[find_result[0]]
            b = nodes0_cpr_all[find_result[1]]
            if (abs(a) >= abs(b)):
                nodes0_cpr.append(a)
            else:
                nodes0_cpr.append(b)

    for i in range(len(n_resin0.nodes)):
        find_result = find2(nodes0_cs1_ind_all, n_resin0.nodes[i].label)
        if (len(find_result) == 1):
            if (find_result == -1):
                pass
            else:
                nodes0_cs1.append(nodes0_cs1_all[find_result[0]])
        else:
            a = nodes0_cs1_all[find_result[0]]
            b = nodes0_cs1_all[find_result[1]]
            if (abs(a) >= abs(b)):
                nodes0_cs1.append(a)
            else:
                nodes0_cs1.append(b)

    for i in range(len(n_resin0.nodes)):
        find_result = find2(nodes0_cs2_ind_all, n_resin0.nodes[i].label)
        if (len(find_result) == 1):
            if (find_result == -1):
                pass
            else:
                nodes0_cs2.append(nodes0_cs2_all[find_result[0]])
        else:
            a = nodes0_cs2_all[find_result[0]]
            b = nodes0_cs2_all[find_result[1]]
            if (abs(a) >= abs(b)):
                nodes0_cs2.append(a)
            else:
                nodes0_cs2.append(b)
    # get value from cpress, cshear1, cshear2
    for i in range(len(n_resin0.nodes)):
        nodes0_ind = n_resin0.nodes[i].label
        nodes0_indList.append(nodes0_ind)
        nodes0_pos = n_resin0.nodes[i].coordinates
        MyNodeList0_cp.append(MyNode(nodes0_ind, nodes0_cpr[i], nodes0_pos))
        MyNodeList0_cs1.append(MyNode(nodes0_ind, nodes0_cs1[i], nodes0_pos))
        MyNodeList0_cs2.append(MyNode(nodes0_ind, nodes0_cs2[i], nodes0_pos))

        
    Total_Area0 = 0
    for k in s_resin0.elements[0]:
        conn = k.connectivity
        if (find(nodes0_indList,conn[3]) == -1):
            n1 = find(nodes0_indList,conn[0])
            n2 = find(nodes0_indList,conn[1])
            n3 = find(nodes0_indList,conn[2])
        elif (find(nodes0_indList,conn[2]) == -1):
            n1 = find(nodes0_indList,conn[0])
            n2 = find(nodes0_indList,conn[1])
            n3 = find(nodes0_indList,conn[3])
        elif (find(nodes0_indList,conn[1]) == -1):
            n1 = find(nodes0_indList,conn[0])
            n2 = find(nodes0_indList,conn[2])
            n3 = find(nodes0_indList,conn[3])
        else:
            n1 = find(nodes0_indList,conn[1])
            n2 = find(nodes0_indList,conn[2])
            n3 = find(nodes0_indList,conn[3])
        node_set0_cp = [MyNodeList0_cp[n1], MyNodeList0_cp[n2], MyNodeList0_cp[n3]]
        node_set0_cs1 = [MyNodeList0_cs1[n1], MyNodeList0_cs1[n2], MyNodeList0_cs1[n3]]
        node_set0_cs2 = [MyNodeList0_cs2[n1], MyNodeList0_cs2[n2], MyNodeList0_cs2[n3]]
        node_set0_cp.sort(key = lambda x:x.data, reverse=True)
        node_set0_cs1.sort(key = lambda x:x.data, reverse=True)
        node_set0_cs2.sort(key = lambda x:x.data, reverse=True)
        ele_cp = MyElement(node_set0_cp[0], node_set0_cp[1], node_set0_cp[2], threshold_enamel_press)
        ele_cs1_n = MyElement(node_set0_cs1[0], node_set0_cs1[1], node_set0_cs1[2], -threshold_enamel_shear)
        ele_cs2_n = MyElement(node_set0_cs2[0], node_set0_cs2[1], node_set0_cs2[2], -threshold_enamel_shear)
        node_set0_cs1.sort(key = lambda x:x.data)
        node_set0_cs2.sort(key = lambda x:x.data)
        ele_cs1_p = MyElement(node_set0_cs1[0], node_set0_cs1[1], node_set0_cs1[2], threshold_enamel_shear)
        ele_cs2_p = MyElement(node_set0_cs2[0], node_set0_cs2[1], node_set0_cs2[2], threshold_enamel_shear)

        A_cp = ele_cp.calc_area_n()
        A_cs1_n = ele_cs1_n.calc_area_n()
        A_cs1_p = ele_cs1_p.calc_area_p()
        A_cs2_n = ele_cs2_n.calc_area_n()
        A_cs2_p = ele_cs2_p.calc_area_p()
        #print A_cp,' ',A_cs1_n,' ',A_cs1_p,' ',A_cs2_n,' ',A_cs2_p
        A = max(A_cp.real, A_cs1_n.real, A_cs1_p.real, A_cs2_n.real, A_cs2_p.real)
        Total_Area0 = Total_Area0 + A
        
    print Total_Area0

    spamwriter.writerow([str(Total_Area0)])
    odb.close()