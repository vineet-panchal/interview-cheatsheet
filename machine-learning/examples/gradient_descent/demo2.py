import numpy as np
import matplotlib.pyplot as plt

X = np.array([55,60,65,70,75,80])
y = np.array([316,292,268,246,227,207])

# Building the model
beta0 = 0
beta1 = 0

a = 0.00001 #learning rate alpha
n_iterations = 1000000

# Perform gradient descent
for i in range(n_iterations):
    yPred = beta0 + beta1*X
    dBeta0 = -2*sum(y-yPred) # Gradient of cost function wrt beta0
    dBeta1 = -2*sum(X*(y-yPred)) #Gradient of cost function wrt beta1
    
    beta0 = beta0 - a*dBeta0
    beta1 = beta1 - a*dBeta1
    print("Iteration", i, ', beta0 =', beta0, ', beta1 =', beta1)
    
# Plot the results
yPred = beta0 + beta1*X
plt.scatter(X,y)
plt.plot(X, yPred, color = 'r')

plt.show()    
