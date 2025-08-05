#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd
import matplotlib.pyplot as plt


sales_df = pd.read_csv("C:/Users/visha/Downloads/archive (8)/monthly_sales.csv")
profit_df = pd.read_csv("C:/Users/visha/Downloads/archive (8)/monthly_Profit.csv")
merged_df = pd.merge(sales_df, profit_df, on='month')


merged_df['month'] = pd.to_datetime(merged_df['month'], format='%Y-%m')
merged_df = merged_df.sort_values('month')
plt.figure(figsize=(12, 6))
plt.plot(merged_df['month'], merged_df['monthly_sales'], marker='o', label='Monthly Sales')
plt.plot(merged_df['month'], merged_df['monthly_profit'], marker='s', label='Monthly Profit')

plt.title("Monthly Sales vs Profit")
plt.xlabel("Month")
plt.ylabel("Amount")
plt.xticks(rotation=45)
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()


# In[5]:


import pandas as pd

sales_df = pd.read_csv("C:/Users/visha/Downloads/archive (8)/monthly_sales.csv")
profit_df = pd.read_csv('C:/Users/visha/Downloads/archive (8)/monthly_Profit.csv')

# Merge on 'month'
merged_df = pd.merge(sales_df, profit_df, on='month')
merged_df.to_csv('monthly_sales_profit.csv', index=False)


# In[ ]:




