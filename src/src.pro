TARGET = nemosignon
PLUGIN_IMPORT_PATH = org/nemomobile/signon

TEMPLATE = lib
CONFIG += qt plugin hide_symbols
QT += qml
QT -= gui

target.path = $$[QT_INSTALL_QML]/$$PLUGIN_IMPORT_PATH
INSTALLS += target

qmldir.files += qmldir plugins.qmltypes
qmldir.path +=  $$target.path
INSTALLS += qmldir

qmltypes.commands = qmlplugindump -nonrelocatable org.nemomobile.signon 1.0 > $$PWD/plugins.qmltypes
QMAKE_EXTRA_TARGETS += qmltypes
DEFINES += SIGNON_UI_NO_EMBED_WEBVIEW

CONFIG += link_pkgconfig
PKGCONFIG += libsignon-qt5

SOURCES += \
           $$PWD/identityinterface.cpp \
           $$PWD/identitymanagerinterface.cpp \
           $$PWD/plugin.cpp \
           $$PWD/serviceaccountidentityinterface.cpp \
           $$PWD/sessiondatainterface.cpp

HEADERS += \
           $$PWD/identityinterface.h \
           $$PWD/identityinterface_p.h \
           $$PWD/identitymanagerinterface.h \
           $$PWD/serviceaccountidentityinterface.h \
           $$PWD/serviceaccountidentityinterface_p.h \
           $$PWD/sessiondatainterface.h

OTHER_FILES += signon.qdoc signon.qdocconf

!contains(DEFINES, SIGNON_UI_NO_EMBED_WEBVIEW) {
    QT += gui
    HEADERS += $$PWD/signonuicontainerinterface.h
    SOURCES += $$PWD/signonuicontainerinterface.cpp
}

MOC_DIR = $$PWD/../.moc
OBJECTS_DIR = $$PWD/../.obj
