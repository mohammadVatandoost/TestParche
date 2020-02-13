#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <QQuickWindow>
#include <QApplication>
#include "standardmodel.h"
#include "backend.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("freevirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    QQuickStyle::setStyle("Material");

//    qmlRegisterType<SensorModel>("SensorModel", 1, 0, "SensorModel");

    BackEnd backEnd;
    StandardModel standardModel;
    backEnd.setStandardModel(&standardModel);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty(QStringLiteral("BackEnd"), &backEnd);
    engine.rootContext()->setContextProperty(QStringLiteral("StandardModel"), &standardModel);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
