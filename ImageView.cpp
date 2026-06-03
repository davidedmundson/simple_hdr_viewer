#include "ImageView.h"

#include <QExposeEvent>
#include <QPainter>
#include <QRect>
#include <QSize>
#include <QSurfaceFormat>
#include <QColorSpace>

ImageView::ImageView(QWindow *parent)
    : QRasterWindow(parent)
{
}

QString ImageView::path() const
{
    return m_path;
}

void ImageView::setPath(const QString &path)
{
    if (m_path == path) {
        return;
    }

    m_path = path;
    m_image = QImage(m_path);


    // in order to change format we have to rebuild our window, this should be fine?
    destroy();
    QSurfaceFormat format = QSurfaceFormat::defaultFormat();
    format.setColorSpace(m_image.colorSpace());
    setFormat(format);

    Q_EMIT pathChanged();

    create();
}

void ImageView::paintEvent(QPaintEvent *event)
{
    QRasterWindow::paintEvent(event);

    QPainter painter(this);
    painter.fillRect(QRect(QPoint(0, 0), size()), Qt::black);

    if (m_image.isNull()) {
        return;
    }

    const QSize targetSize = m_image.size().scaled(size(), Qt::KeepAspectRatio);
    const QRect targetRect(
        QPoint((width() - targetSize.width()) / 2, (height() - targetSize.height()) / 2),
        targetSize);

    painter.drawImage(targetRect, m_image);
}
