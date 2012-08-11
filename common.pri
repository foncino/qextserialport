CONFIG += qextserialport-no-udev

# Though maybe you have been fimiliar with "TEMPLATE += fakelib" and "TEMPLATE -= fakelib",
# but it don't work when you using "qmake -tp XXX". So I use another variable Here.
SAVE_TEMPLATE = $$TEMPLATE
TEMPLATE = fakelib
contains(QT_VERSION, ^5\\..*\\..*) {
    #different name for Qt4 and Qt5
    QEXTSERIALPORT_LIBNAME = $$qtLibraryTarget(QtExtSerialPort-1.2)
} else {
    QEXTSERIALPORT_LIBNAME = $$qtLibraryTarget(qextserialport-1.2)
}
TEMPLATE = $$SAVE_TEMPLATE
QEXTSERIALPORT_LIBDIR = $$PWD/lib
unix:qextserialport-library:!qextserialport-buildlib:QMAKE_RPATHDIR += $$QEXTSERIALPORT_LIBDIR
