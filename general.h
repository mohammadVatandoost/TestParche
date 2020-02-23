#ifndef GENERAL_H
#define GENERAL_H

#include <iostream>

#define Stoped 0
#define Paused 1
#define Runing 2

#define CoolerOn "R0"
#define CoolerOff "r0"

#define UlteraOn "R1"
#define UlteraOff "r1"

#define MainFanOn "R2"
#define MainFanOff "r2"

#define XenonOn "R3"
#define XenonOff "r3"

#define RHFanOn "R4"
#define RHFanOff "r4"

#define MotorOn "R5"
#define MotorOff "r5"

#define SprayOn "R6"
#define SprayOff "r6"

#define SparkOn "R7"
#define SparkOff "r7"

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
    int testTimeSecond = 0;
};

#endif // GENERAL_H
