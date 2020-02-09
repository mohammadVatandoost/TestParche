#ifndef GENERAL_H
#define GENERAL_H

#include <iostream>

using namespace std;

struct General {
    float temperature = 0;
    float humidity = 0;
    float lampTemp = 0;
    float STDBlackTemp = 0;
    float analog1 = 0;
    float analog2 = 0;
    float lightIntensity = 0;
    int input1 = 0;
    int input2 = 0;
    bool ulteraSonic = false;
    bool mainFan = false;
    bool xenon = false;
    bool motor = false;
    bool cooler = false;
    bool spray = false;
};

#endif // GENERAL_H
