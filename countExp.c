#define max_accuracy 0.5
double countExp(double accuracy) {
    double exp = 0;
    int n = 1;
    double fact = 1;
    while (4.0 / (fact) > accuracy) {
        exp += 1.0 / fact;
        fact *= n;
        ++n;
    }
    return exp;
}
