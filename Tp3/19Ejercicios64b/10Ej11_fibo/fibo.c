unsigned int fibo(unsigned int input){
    if (input==0){
        return 0;
    } else if (input==1){
        return 1;
    }
    return fibo(input-1)+fibo(input-2);
}