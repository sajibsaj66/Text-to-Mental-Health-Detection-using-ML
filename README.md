# Text to Mental Health Detection using Machine Learning. 
## App name : BetterAid 🩺

#
## System architecture

This is a mobile application-based health assistant with integrated machine-learning algorithms. From the app, users can log in and create a profile by undergoing an OTP verification. If already signed in, the user can directly log in to the homepage. After logging in, users will be directed to the homepage where they will have a mental health detection service, BMI calculator, and a panel for doctor’s information. Mental health experts detect mental health problems through machine-learning algorithms. To implement machine learning algorithms, we created a dataset from scratch. For the dataset, we have extracted social media texts through web scraping. “Instant Data Scraper” is used to extract the data from Reddit. Reddit is a great source of rich text-based quality datasets. Then we manually cleaned and annotated the data. Jupyter notebook is used as the source editor for the model implementations. We merged the dataset into a single dataset in the notebook. Removed stopwords, Tokenized, and used stemming techniques on the dataset. For feature extraction, TF-IDF is used. Pre-trained machine learning algorithms are used to train the model. XGBoost and Naive Bayes are implemented as machine learning models. The machine learning algorithm is integrated with a flask API to integrate the machine learning algorithm into the mobile app.

#



## Login & OTP Pannel


 <img src="https://user-images.githubusercontent.com/86792533/210851785-46a49064-7f05-4e46-b8ae-7b49fa403128.jpg" width="300"  height ="650"  />             <img src="https://user-images.githubusercontent.com/86792533/210851774-01a5bc85-f75b-40e5-82c9-e9a148b522f6.jpg" width="300"  />



#


## Home Page 

<img src="https://user-images.githubusercontent.com/86792533/210853161-30ca8a44-f33f-4102-a3d5-d372d927bcdf.png" width="300"  /> <img src="https://user-images.githubusercontent.com/86792533/210853095-3f020160-4352-4d60-ae69-ef8d377f5edd.png" width="300"  />

## Doctor Information
<img src="https://user-images.githubusercontent.com/86792533/210853272-16a8708c-35ff-4fbe-aa4b-c44b366a4562.png" width="300"  />





#
# Prediction Part 👈🏻
#
<img src="https://user-images.githubusercontent.com/86792533/210847276-c79f385e-54b4-4715-8128-930ee75ab1e2.png" width="300" />   <img src="https://user-images.githubusercontent.com/86792533/210846707-10c8f273-b496-4006-93f1-fa8056ff1a6e.png" width="300" height ="500" />  <img src="https://user-images.githubusercontent.com/86792533/210847313-928d5f0c-1517-42bb-a5bc-9a9086011924.png" width="300" height ="500" />



## Suggested Doctor using prediction part

<img src="https://user-images.githubusercontent.com/86792533/210847781-f3bac60d-f27f-4dad-9b59-0e0692e17cff.jpg" width="300" /> <img src="https://user-images.githubusercontent.com/86792533/210847797-e43b3fb5-e90c-4553-9cf0-32b302854f79.jpg" width="300"  height ="650"  />




