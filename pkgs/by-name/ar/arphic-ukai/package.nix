{
  lib,
  stdenvNoCC,
  fetchurl,
  mkfontdir,
  mkfontscale,
}:

stdenvNoCC.mkDerivation rec {
  pname = "arphic-ukai";
  version = "0.2.20080216.2";

  src = fetchurl {
    url = "mirror://ubuntu/pool/main/f/fonts-${pname}/fonts-${pname}_${version}.orig.tar.bz2";
    hash = "sha256-tJaNc1GfT4dH6FVI+4XSG2Zdob8bqQCnxJmXbmqK49I=";
  };

  nativeBuildInputs = [
    mkfontscale
    mkfontdir
  ];

  installPhase = ''
    runHook preInstall

    install -D -v ukai.ttc $out/share/fonts/truetype/arphic-ukai.ttc
    cd $out/share/fonts
    mkfontdir
    mkfontscale

    runHook postInstall
  '';

  meta = with lib; {
    description = "CJK Unicode font Kai style";
    homepage = "https://www.freedesktop.org/wiki/Software/CJKUnifonts/";

    license = licenses.arphicpl;
    maintainers = [ maintainers.changlinli ];
    platforms = platforms.all;
  };
}
