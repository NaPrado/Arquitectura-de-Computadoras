struct t1{
    char x;
    int y;
    char z;
};
void main(void){
    struct t1 A={1,2,3};
    printf("%d",incSumT(A));
    return 0;
}
int incSumT(struct t1 W){
    static struct t1 B={1,1,1};
    return  W.x+B.x+
            W.y+B.y+
            W.z*B.y;
}
