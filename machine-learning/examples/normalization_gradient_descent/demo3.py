import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler

X = np.array([55,60,65,70,75,80]).reshape(-1,1)
y = np.array([316,292,268,246,227,207]).reshape(-1,1)

scalerX = StandardScaler()
scalerX.fit(X)
scalerY = StandardScaler()
scalerY.fit(y)

xScaled = scalerX.transform(X)
yScaled = scalerY.transform(y)


# Building the model
beta0 = 0
beta1 = 0

a = 0.001 #learning rate alpha
n_iterations = 1000

# Perform gradient descent
for i in range(n_iterations):
    yPred = beta0 + beta1*xScaled
    dBeta0 = -2*sum(yScaled-yPred) # Gradient of cost function wrt beta0
    dBeta1 = -2*sum(xScaled*(yScaled-yPred)) #Gradient of cost function wrt beta1
    
    beta0 = beta0 - a*dBeta0
    beta1 = beta1 - a*dBeta1
    print("Iteration", i, ', beta0 =', beta0, ', beta1 =', beta1)
    
# Plot the results
yPred = beta0 + beta1*xScaled

plt.scatter(X,y)
plt.plot(X, scalerY.inverse_transform(yPred), color = 'r')

plt.show()    
