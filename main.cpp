#include <QApplication>
#include <QDir>
#include <QFileSystemModel>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QStandardPaths>
#include <QStringList>
#include <QUrl>
#include <QTimer>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/SimpleImageViewer/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
