Name:       nemo-qml-plugin-signon-qt5

Summary:    Signon framework support for QML applications
Version:    0.0.0
Release:    1
Group:      System/Libraries
License:    BSD
URL:        https://git.merproject.org/mer-core/nemo-qml-plugin-signon
Source0:    %{name}-%{version}.tar.bz2
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  pkgconfig(Qt5Test)
BuildRequires:  pkgconfig(libsignon-qt5)

%description
%{summary}.

%package signon-tests
Summary:    QML signon plugin tests
Group:      System/Libraries
Requires:   %{name} = %{version}-%{release}

%description signon-tests
%{summary}.

%prep
%setup -q -n %{name}-%{version}

%build
%qmake5 

make %{?_smp_mflags}

%install
rm -rf %{buildroot}
%qmake_install

%files
%defattr(-,root,root,-)
%{_libdir}/qt5/qml/org/nemomobile/signon/libnemosignon.so
%{_libdir}/qt5/qml/org/nemomobile/signon/plugins.qmltypes
%{_libdir}/qt5/qml/org/nemomobile/signon/qmldir

%files signon-tests
%defattr(-,root,root,-)
/opt/tests/nemo-qml-plugins-qt5/signon/*
