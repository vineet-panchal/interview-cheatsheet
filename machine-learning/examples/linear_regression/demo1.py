import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn import linear_model
from sklearn.metrics import mean_squared_error

X = np.load(r"C:\Users\elodi\Desktop\Xdata.npy")
y = np.load(r"C:\Users\elodi\Desktop\Ydata.npy")
plt.scatter(X,y, color = 'black')
plt.xlabel('X')
plt.ylabel('y')

# Split the data in training and test set
xTrain, xTest, yTrain, yTest = train_test_split(X, y, test_size=0.3)

# Create a linear regression object
reg = linear_model.LinearRegression()
# Train the model
reg.fit(xTrain, yTrain)

# Plot the linear fit
yPred = reg.predict(xTrain)
plt.scatter(xTrain, yPred, color = 'r')

# Model evaluation- apply the model on the test set
yPredTest = reg.predict(xTest)

print("The mean squared error = %.2f" % mean_squared_error(yTest, yPredTest))