#ifndef STANDARD_H
#define STANDARD_H

#include <iostream>

using namespace std;

struct Standard {
    int standardId;
    string standardName = "";
    float temperature = 0;
    bool turningMode = false;
    bool weathering = false;
    int rainOn = 0;
    int rainOff = 0;
    int humidity = 0;
};

#endif // STANDARD_H
