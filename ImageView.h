#pragma once

#include <QImage>
#include <QRasterWindow>
#include <QString>
#include <qqmlintegration.h>

class QExposeEvent;

class ImageView : public QRasterWindow
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString path READ path WRITE setPath NOTIFY pathChanged)

public:
    explicit ImageView(QWindow *parent = nullptr);

    QString path() const;
    void setPath(const QString &path);

signals:
    void pathChanged();

protected:
    void paintEvent(QPaintEvent *event) override;

private:
    QString m_path;
    QImage m_image;
};
