#include "standardslist.h"

StandardsList::StandardsList()
{

}

QVector<Standard> StandardsList::items()
{
    return standardItems;
}

void StandardsList::addChannelItem(Standard item)
{
    standardItems.append(item);
}

bool StandardsList::setChannelItem(int index, Standard standard)
{
    if(index <0 || index >= standardItems.size())
        return false;


    standardItems[index] = standard;

    return true;
}
