#include "standardslist.h"

StandardsList::StandardsList()
{

}

QVector<Standard> StandardsList::items()
{
    return standardItems;
}

void StandardsList::addStandardItem(Standard item)
{
    standardItems.append(item);
}

bool StandardsList::setStandardItem(int index, Standard standard)
{
    if(index <0 || index >= standardItems.size())
        return false;


    standardItems[index] = standard;

    return true;
}
