/* 
Case study: Sales Analysis for a bike company
In this noteook, we're going to analyse sales performance for an Australian-based start-up company who provies outdoor adventure and sporting products nation-wide.


*/


# 1. Questioning

- What is the senior management trying to achieve? what is their focus?
- What questions would they have about their sales performance?
- Can I answer them?

To understand what they need, I interviewed a few CEO's I know and asked one single question 'How do you measure your sales performance?' and the pattern I found from all of them was that they start by splitting their revenue, profit and expenses by different categories that matter to their businesses.

I realised my job is to help them oversee such information as if they are looking at a bird's-eye view. Then I started writing down the requirements for success.

My dashboard should

- Provide a fundamental overview of the company's sales. So any CEO can identify the problem at a glance.
- Entail categories they care about.
- Contain minimal filtering options as they will not be interested in too many details yet.

Metrics the CEO would care about 

- **Total Revenue / profit / expenses**
- **Sales volume by location**
- **Revenue by product category**
- **Customer Acquisition Cost (CAC) ((Sales expense + Marketing expenses) / New customers acquired): Cost required to obtain new customers**
- **~~Customer lifetime value (LTV)~~** = Customer Value x Average Customer lifespan (x): It is misleading to determine the average customer lifespan based on 3 years of data, especially when the bike has 5 years of life-cycle.
- The a**verage revenue per customer**
- Sales % by **New vs existing customer**
- ~~Market penetration rate:~~ Market research data is not available.

# 2. Reviewing Data & Data Cleaning

Tried to understand the relationships between datasets I was given and put them into a model. (*Modelling available)

Ensured there is no duplicated or null columns in datasets.

- Identified Duplicated rows in 'Product_Subcategories' Table

WITH RowNum_CTE AS(
Select *,
ROW_NUMBER() OVER (
PARTITION BY productSubcategoryKey,
SubcategoryName,
ProductCategoryKey
ORDER BY ProductSubcategoryKey) row_num

FROM [NAB Job assessment].dbo.Product_Subcategories$)

DELETE
FROM RowNum_CTE
WHERE row_num > 1

# 3. Data Wrangling to get the following metrics

- **Total Revenue / profit / expenses**
- **Sales volume by location**
- **Best-selling product category**
- **Customer Acquisition Cost (CAC) ((Sales expense + Marketing expenses) / New customers acquired)**
- **Average revenue per account / product / customer**
- **% of Revenue from new vs existing customer**
- **Product Return rate**

*SQL Code available on request

Insights

# 1. Trendline Graph

The company had ups and downs with its sales revenue until January 2016 and then they started to grow.
The company's profit is not growing as much as its revenue, in fact, the gap is getting larger. Company's profit is suffering

This could mean either product cost is too expensive or the price is too low, which CEO would need to review in further detail.

# 2. Average revenue vs Customer Acquisition cost

Explain ARPC & CAC→ Difference between these two, for now, seems ok (about 38%) → Set date range to 2017  
The difference between the two is $100, which is about 12% profit margin from new customers.

This indicates acquiring new customers is not efficient. It appears targeting existing customers is the smarter move here.

# 3. Sales % by New customers

The why new customers are expensive could be because they already have new customers. But didn't manage to retain them.
This pie graph shows lots of customers only made one-off purchases which indicates customers are not really coming back for more.

This could be because of many reasons such as poor product quality, customer service or simply because of the nature of business. 

# 4. Sales % by Product

What I mean by this is if you have at the table above, you can see that the company's revenue stream is highly-focused on bike sales. But the profit margin % is the lowest (41.15%).
On the other hand, Accessories sales are only at 3.3% although the profit margin % is highest at 62.8%

This could be an opportunity for the company to upsell or cross-sell these products that as they have healthier margins %. They can start by creating a very targeted campaign.

# 5. 0 sales in the 'Component' product category.

And there is another problem, you may not have noticed from the Visuals, but the company has made 0 sales on component products.
This means two things, their components are not competitive in the market or customers don't know what to do with the components. What they really need can be a bike-repair service, not just parts. Also, components themselves can be bought easily online.
This can be an opportunity to consider providing bike-repair services that entail three benefits for the company.

1. The company can sell components.
2. With good product and services quality, customers will be returning.
3. The company gains a competitive advantage in the market as its service is more personalized to each individual customer which will help with engagement.

But this is only a suggestion and it is up to the CEO to decide the company's directions.

# 6. Conclusion

The problem of the company is their profit margin rate is suffering due to a lack of returning customers. Rather than trying to branch or reach out to new customers, Wonderland should really focus on selling products with healthier margins (Like Accessories) to existing customers. This can be done by 

- Reviewing their customer service.
- Reviewing their cost and prices
- Providing good deals on accessories products to customers who need them.
- Providing bike-repair services to customers.

They can start targeting the regions with the most sales like  NSW or Victoria. 

