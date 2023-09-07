import pandas as pd
import sys
import pickle# saving and loading trained model

f_read = open("C:\\Users\\ACER\\Desktop\\shoes-store-manage-master\\src\\main\\java\\duLieuDeXuat.txt", 'r')

date = f_read.read()
argv = []
for i in date.split(' '):
    argv.append(int(i))
f_read.close()

c1 = argv[0]
c2 = argv[1]
c3 = argv[2]
c4 = argv[3]
c5 = argv[4]
c6 = argv[5]
c7 = argv[6]
c8 = argv[7]
c9 = argv[8]

df_test = pd.DataFrame({"c1": [int(c1)], "c2": [int(c2)], "c3": [int(c3)], "c4": [int(c4)], "c5": [int(c5)],
                        "c6": [int(c6)], "c7": [int(c7)], "c8": [int(c8)], "c9": [int(c9)]})

# print(df_test.head())
filename = 'lsvm_multi.pkl'
load_model = pickle.load(open("C:\\Users\ACER\\Desktop\\shoes-store-manage-master\\src\\main\\python\\"+filename, 'rb'))
predicts = load_model.predict(df_test)
print(predicts[0])



