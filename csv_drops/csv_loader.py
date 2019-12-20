## usage pyq csv_drops/csv_loader.py -dir csv_drops/trade.csv
import pandas as pd 
import numpy as np
from pyq import q
import sys

dir = sys.argv[1+ sys.argv.index('--dir')] ## read csv directory from cmd line args
dt=pd.read_csv(dir) #use of pandas read_csv 
q.dt = [np.array(dt[x]) for x in dt.columns] #convert dt columns into arrays
q.dt = q.dt.flip # flip to the correct format for upsert
h = q.hopen('::5010') # hopen to tickerplant
upsert2 = q('{[x;y].at.d:(x;y); y[;0] : "N"$string y[;0]; x upsert y}') # create function to update symbol timespan column
h((upsert2,'trade',(q.dt)))
