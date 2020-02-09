#ifndef STANDARD_H
#define STANDARD_H

#include <iostream>

using namespace std;

struct Standard {
    int standardNum ;
    string standardName = "";
    float temperature = 0;
    bool turningMode = false;
    bool weathering = false;
    int rainOn = 0;
    int rainOfff = 0;
};

#endif // STANDARD_H
