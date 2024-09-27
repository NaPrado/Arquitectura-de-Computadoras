int factorial(int n) { 
    int aux, fact; 

    if(n==0) 
        return 1; 
    
    aux = n; 
    fact = factorial(n-1); 
    
    return fact * aux; 
} 
