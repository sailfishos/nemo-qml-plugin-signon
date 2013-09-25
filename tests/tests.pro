TEMPLATE = subdirs
SUBDIRS = \
    tst_identityinterface \
    tst_serviceaccountidentityinterface

unix{
    tests_xml.target = tests.xml
    tests_xml.files = tests.xml
    equals(QT_MAJOR_VERSION, 4): tests_xml.path = /opt/tests/nemo-qml-plugins/signon
    equals(QT_MAJOR_VERSION, 5): tests_xml.path = /opt/tests/nemo-qml-plugins-qt5/signon
    tests_xml.CONFIG = no_check_exist
    tests_xml.commands = sed \'s%@PATH@%$${tests_xml.path}%\' $$PWD/tests.xml.in > $$PWD/tests.xml

    QMAKE_DISTCLEAN += tests.xml

    INSTALLS += tests_xml
}
