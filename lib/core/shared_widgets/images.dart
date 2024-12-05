import 'package:flutter/material.dart';

abstract class Images {
  /// Private Const constructor to prevent getting an object of this class
  const Images._();

  /// All images that stored in this path
  static const _folderPath = 'assets/images';
  static const logoImage = '$_folderPath/Group 65.png';
  static const bgIntro = '$_folderPath/Group 61.png';
  //.GIF #######################################################################
  /// GIF images that stored in [_folderPath]/git/
  static const _gifPath = '$_folderPath/gif';

  //.PNG #######################################################################
  /// Normal images [.png, .jpg, ...etc] that stored in [_folderPath]/normal/
  static const _normalPath = '$_folderPath/normal';

  static const maherAlMueaqly = '$_normalPath/maher_al_mueaqly.png';

  // static const classicBeigeBackground='$_normalPath/classic_beige_background.png';

  // SVG Icons #################################################################
  /// SVG images icon that stored in [_folderPath]/svg_icon/
  static const _svgIconPath = '$_folderPath/svg';

  static const crescentIcon = '$_svgIconPath/crescent.svg';
  static const backGroundPng = '$_folderPath/png/Login.png';
  
  static const authbackGroundPng = '$_folderPath/png/authBack.png';
  static const AutofillHints = '$_folderPath/png/Login.png';

  static const backGroundPng2 = '$_folderPath/header2.png';
  static const playerInfoBackground = '$_folderPath/player_info.png';
  static const playerStatsBackground = '$_folderPath/player_states.png';
  static const playerTeamsBackground = '$_folderPath/player_info.png';
  static const playerGamesBackground = '$_folderPath/player_info.png';

  static const gameImage = '$_folderPath/game.png';
  static const gamesImage = '$_folderPath/games.jpg';
  static const teamsImage = '$_folderPath/teams.jpg';
  static const playersImage = '$_folderPath/players.jpg';
  static const sponsorsImage = '$_folderPath/sponsers.jpg';
  static const freePlayImage = '$_folderPath/free play.jpg';
  static const gymsImage = '$_folderPath/gyms.jpg';



  static const findCityImageSvg = '$_folderPath/city.svg';
  static const introImage = '$_folderPath/intro.png';
  static const NewintroImage = '$_folderPath/new_intro.png';
  static const introLightImage = '$_folderPath/intro_light.png';

  static const logoSvg = 'assets/icons/logo.svg';
  // static const newLogoSvg = 'assets/icons/new_logo.svg';
 // static const newLogoSvg = 'assets/icons/gotgame_new_logo.svg';
  static const newLogoSvg = 'assets/icons/logo_with_text.png';
  static getIconSvg(String iconName) => 'assets/icons/svg/$iconName.svg';

  // Vector Images #############################################################
  /// Vector images (illustrator images) that stored in [_folderPath]/vector/
  static const _vectorPath = '$_folderPath/vector';
}
