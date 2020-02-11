#ifndef GENERAL_H
#define GENERAL_H

#include <iostream>

using namespace std;

struct GeneralData {
    float temperature = 0;
    float humidity = 0;
    float lampTemp = 0;
    float STDBlackTemp = 0;
    float analog1 = 0;
    float analog2 = 0;
    int lightIntensity = 0;
    int input1 = 0;
    int input2 = 0;
    bool ulteraSonic = false;
    bool mainFan = false;
    bool xenon = false;
    bool motor = false;
    bool cooler = false;
    bool spray = false;
    int testTimeHour = 0;
    int testTimeMinute = 0;
    long int lifeTime = 0;
    bool filtersActivity[6] = {false};
    long filtersLifeTime[6] = {0};
};

#endif // GENERAL_H
