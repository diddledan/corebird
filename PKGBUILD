
pkgname=corebird-git
pkgver=20130110
pkgrel=1
_realver=0.5
pkgdesc="Native Gtk+ Twitter Client"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/baedert/corebird"
depends=('gtk3>=3.10'
     'glib2>=2.38'
     'rest>=0.7'
     'libgee'
     'sqlite3'
     'libsoup>=2.4'
     'libnotify'
     'json-glib')
makedepends=('vala>=0.21.1' 'git' 'cmake')

_gitroot="https://github.com/baedert/corebird.git"
_gitname="corebird"

build() {
  cd $srcdir
  msg "connecting to bitbucket GIT server"

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "the local files are updated"
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make ..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd $srcdir/$_gitname-build

  msg "Starting build..."
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR=$pkgdir install
}

