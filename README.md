CakePHP開発環境構築マニュアル
-------------------------
# 動作環境

すべてパッケージインストール。ただし、PHPは[dotdeb](http://www.dotdeb.org/)を使用して5.4をインストールしている。

- OS - Ubuntu 12.04
- Apache - 2.2.22-1ubuntu1
- PHP - 5.4.24-1~dotdeb.0
	- php5-pgsql
	- php-gd
	- php5-zendopcache
	- php5-xdebug
	- php-pear
	- php5-curl
	- php5-cli
- PostgreSQL - 9.1.11
- curl
- git
- vim
- tree

# アプリケーションの初期設定

自動で設定するとアプリで変更したものを更新してしまう可能性などあるので、以下は手動にて設定してください。

	~/app/Config/bootstrap.php 以下のPluginパスの設定を追記
	snip...
	 * CakePlugin::loadAll(); // Loads all plugins at once
	 * CakePlugin::load('DebugKit'); //Loads a single plugin named DebugKit
	 *
	 */
	App::build(array(
		'Plugin' => array(realpath(dirname(__FILE__) . DS . '../../Plugin') . DS)
	));
	CakePlugin::loadAll();
	snip...
