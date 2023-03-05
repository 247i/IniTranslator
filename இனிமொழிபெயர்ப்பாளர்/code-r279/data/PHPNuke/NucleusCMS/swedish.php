<?php
// Swedish Nucleus Language File
// Svensk spr�kfil
//
// Author: Johan �sterstr�m
// Website: www.osterstrom.nu
// E-mail: johan@osterstrom.nu
// FEEL FREE TO SEND AN E-MAIL IF YOU USE THIS LANGUAGE-FILE!
// {-- R�sta f�r maktskifte 2006 --}
// Nucleus version: v1.0-v3.2
//


// START changed/added after 3.15 START

define('_LIST_PLUG_SUBS_NEEDUPDATE','V�nligen anv�nd knappen f�r att uppdatera.');
define('_LIST_PLUGS_DEP',			'Plugin(s) kr�ver:');

// END changed/added after 3.15

// START changed/added after 3.1 START

// comments list per weblog
define('_COMMENTS_BLOG',			'Alla kommentarer p� bloggen');
define('_NOCOMMENTS_BLOG',			'Inga kommentarer har l�mnats');
define('_BLOGLIST_COMMENTS',		'Kommentarer');
define('_BLOGLIST_TT_COMMENTS',		'En lista p� alla kommentarer i denna bloggen');


// for use in archivetype-skinvar
define('_ARCHIVETYPE_DAY',			'dag');
define('_ARCHIVETYPE_MONTH',		'm�nad');

// tickets (prevents malicious users to trick an admin to perform actions he doesn't want)
define('_ERROR_BADTICKET',			'Ogiltig handling.');

// plugin dependency
define('_ERROR_INSREQPLUGIN',		'Installationen av en plug-in misslyckades, den kr�ver ');
define('_ERROR_DELREQPLUGIN',		'Avinstallationen av en plug-in misslyckades, ');

// cookie prefix
define('_SETTINGS_COOKIEPREFIX',	'Cookie-f�rstavelse');

// account activation
define('_ERROR_NOLOGON_NOACTIVATE',	'Kan inte skicka aktiveringskoden. Du �r inte till�ten att logga in.');
define('_ERROR_ACTIVATE',			'Aktiveringsnyckeln existerar inte, �r felaktig eller har g�tt ut.');
define('_ACTIONLOG_ACTIVATIONLINK', 'Aktiveringsl�nken har skickats.');
define('_MSG_ACTIVATION_SENT',		'En aktiveringsl�nk har skickats via mejl.');

// activation link emails
define('_ACTIVATE_REGISTER_MAIL',	"Hej <%memberName%>,\n\nDu beh�ver aktivera ditt konto hos <%siteName%> (<%siteUrl%>).\nDu kan g�ra det genom att bes�ka nedanst�ende l�nk: \n\n\t<%activationUrl%>\n\nDetta m�ste ske inom 2 dagar, d�refter blir aktiveringsl�nken ogiltig.");
define('_ACTIVATE_REGISTER_MAILTITLE',	"Aktivera ditt '<%memberName%>' konto");
define('_ACTIVATE_REGISTER_TITLE',	'V�lkommen <%memberName%>');
define('_ACTIVATE_REGISTER_TEXT',	'Du �r n�stan klar. V�nligen v�lj ett l�senord f�r ditt konto nedan.');
define('_ACTIVATE_FORGOT_MAIL',		"Hej <%memberName%>,\n\nGenom att anv�nda nedanst�ende l�nk, kan du v�lja ett nytt l�senord hos <%siteName%> (<%siteUrl%>).\n\n\t<%activationUrl%>\n\nAktiveringsl�nken �r giltig i 2 dagar.");
define('_ACTIVATE_FORGOT_MAILTITLE',"�teraktivera ditt '<%memberName%>' konto");
define('_ACTIVATE_FORGOT_TITLE',	'V�lkommen <%memberName%>');
define('_ACTIVATE_FORGOT_TEXT',		'Du kan v�lja ett nytt l�senord nedan:');
define('_ACTIVATE_CHANGE_MAIL',		"Hej <%memberName%>,\n\nEftersom du har �ndrat mejladress, m�ste du �teraktivera kontot hos <%siteName%> (<%siteUrl%>).\nG�r det genom att klicka p� nedanst�ende l�nk: \n\n\t<%activationUrl%>\n\nAktiveringsl�nken �r giltig i 2 dagar.");
define('_ACTIVATE_CHANGE_MAILTITLE',"�teraktivera ditt '<%memberName%>' konto");
define('_ACTIVATE_CHANGE_TITLE',	'Welcome <%memberName%>');
define('_ACTIVATE_CHANGE_TEXT',		'Din nya adress har verifierats. Tack!');
define('_ACTIVATE_SUCCESS_TITLE',	'Aktiveringen lyckades');
define('_ACTIVATE_SUCCESS_TEXT',	'Ditt konto har aktiverats.');
define('_MEMBERS_SETPWD',			'�ndra l�senord');
define('_MEMBERS_SETPWD_BTN',		'�ndra l�senord');
define('_QMENU_ACTIVATE',			'Aktivering av konto');
define('_QMENU_ACTIVATE_TEXT',		'<p>Efter du har aktiverat ditt konto, kan du b�rja anv�nda det genom att <a href="index.php?action=showlogin">logga in</a>.</p>');

define('_PLUGS_BTN_UPDATE',			'Uppdatera prenumerationslistan');

// global settings
define('_SETTINGS_JSTOOLBAR',		'Stil');
define('_SETTINGS_JSTOOLBAR_FULL',	'Full verktygsl�da (IE)');
define('_SETTINGS_JSTOOLBAR_SIMPLE','Enkel vertygsl�da (Annan)');
define('_SETTINGS_JSTOOLBAR_NONE',	'Inaktivera verktygsl�da');
define('_SETTINGS_URLMODE_HELP',	'(Information: <a href="documentation/tips.html#searchengines-fancyurls">Hur aktiverar man Fancy URLs?</a>)');

// extra plugin settings part when editing categories/members/blogs/...
define('_PLUGINS_EXTRA',			'Extra inst�llningar f�r plug-ins');

// itemlist info column keys
define('_LIST_ITEM_BLOG',			'blogg:');
define('_LIST_ITEM_CAT',			'kategori:');
define('_LIST_ITEM_AUTHOR',			'f�rfattare:');
define('_LIST_ITEM_DATE',			'datum:');
define('_LIST_ITEM_TIME',			'tid:');

// indication of registered members in comments list
define('_LIST_COMMENTS_MEMBER', 	'(medlem)');

// batch operations
define('_BATCH_WITH_SEL',			'Med vald:');
define('_BATCH_EXEC',				'K�r');

// quickmenu
define('_QMENU_HOME',				'Hem');
define('_QMENU_ADD',				'L�gg till inl�gg');
define('_QMENU_ADD_SELECT',			'-- V�lj --');
define('_QMENU_USER_SETTINGS',		'Inst�llningar');
define('_QMENU_USER_ITEMS',			'Inl�gg');
define('_QMENU_USER_COMMENTS',		'Kommentarer');
define('_QMENU_MANAGE',				'Handhavande');
define('_QMENU_MANAGE_LOG',			'Loggbok');
define('_QMENU_MANAGE_SETTINGS',	'�vergripande inst�llningar');
define('_QMENU_MANAGE_MEMBERS',		'Medlemmar');
define('_QMENU_MANAGE_NEWBLOG',		'Ny Weblog');
define('_QMENU_MANAGE_BACKUPS',		'Backup');
define('_QMENU_MANAGE_PLUGINS',		'Plug-ins');
define('_QMENU_LAYOUT',				'Utseende');
define('_QMENU_LAYOUT_SKINS',		'Skins');
define('_QMENU_LAYOUT_TEMPL',		'Mallar');
define('_QMENU_LAYOUT_IEXPORT',		'Importera/Exportera');
define('_QMENU_PLUGINS',			'Plug-ins');

// quickmenu on logon screen
define('_QMENU_INTRO',				'Introduktion');
define('_QMENU_INTRO_TEXT',			'<p>Det h�r �r login-sk�rmen f�r Nucleus CMS, inl�ggsystemet som anv�nds p� denna webbplats.</p><p>Om du har ett konto kan du logga in och b�rja skriva inl�gg.</p>');

// helppages for plugins
define('_ERROR_PLUGNOHELPFILE',		'Hj�lpfilen f�r denna plug-in kan inte hittas');
define('_PLUGS_HELP_TITLE',			'Hj�lpsida f�r plug-in');
define('_LIST_PLUGS_HELP', 			'hj�lp');


// END changed/started after 3.1

// START changed/added after v2.5beta START

// general settings (security)
define('_SETTINGS_EXTAUTH',			'Aktivera extern autentisering');
define('_WARNING_EXTAUTH',			'Varning! Aktivera endast vid behov.');

// member profile
define('_MEMBERS_BYPASS',			'Anv�nd extern autentisering');

// 'always include in search' blog setting (yes/no) [in v2.5beta, the 'always' part wasn't clear]
define('_EBLOG_SEARCH',				'<em>Alltid</em> inkluderad i s�kningar');

// END changed/added after v2.5beta

// START introduced after v2.0 START

// media library
define('_MEDIA_VIEW',				'visa');
define('_MEDIA_VIEW_TT',			'Visa fil (�ppnas i ett nytt f�nster)');
define('_MEDIA_FILTER_APPLY',		'Applicera filter');
define('_MEDIA_FILTER_LABEL',		'Filter: ');
define('_MEDIA_UPLOAD_TO',			'Ladda upp till...');
define('_MEDIA_UPLOAD_NEW',			'Ladda upp ny fil...');
define('_MEDIA_COLLECTION_SELECT',	'V�lj');
define('_MEDIA_COLLECTION_TT',		'V�xla till denna kategorin');
define('_MEDIA_COLLECTION_LABEL',	'Aktuell samling: ');

// tooltips on toolbar
define('_ADD_ALIGNLEFT_TT',			'V�nsterjusterad');
define('_ADD_ALIGNRIGHT_TT',		'H�gerjusterad');
define('_ADD_ALIGNCENTER_TT',		'Centrera');


// generic upload failure
define('_ERROR_UPLOADFAILED',		'Uppladdningen misslyckades');

// END introduced after v2.0 END

// START introduced after v1.5 START

// posting to the past/edit timestamps
define('_EBLOG_ALLOWPASTPOSTING',	'Till�t retroaktiva inl�gg');
define('_ADD_CHANGEDATE',			'Uppdatera tidsmarkering');
define('_BMLET_CHANGEDATE',			'Uppdatera tidsmarkering');

// skin import/export
define('_OVERVIEW_SKINIMPORT',		'Importera/Exportera Skin...');

// skin settings
define('_PARSER_INCMODE_NORMAL',	'Normal');
define('_PARSER_INCMODE_SKINDIR',	'Anv�nd mapp f�r Skins');
define('_SKIN_INCLUDE_MODE',		'Inkluderingsl�ge');
define('_SKIN_INCLUDE_PREFIX',		'Inkluderingsf�rstavelse');

// global settings
define('_SETTINGS_BASESKIN',		'Grundl�ggande Skin');
define('_SETTINGS_SKINSURL',		'URL f�r Skins');
define('_SETTINGS_ACTIONSURL',		'Hela URL:en till filen action.php');

// category moves (batch)
define('_ERROR_MOVEDEFCATEGORY',	'Kan inte flytta standardkategorin');
define('_ERROR_MOVETOSELF',			'Kan inte flytta kategorin (destinations-bloggen �r samma som k�llan)');
define('_MOVECAT_TITLE',			'V�lj blogg att flytta kategorin till');
define('_MOVECAT_BTN',				'Flytta');

// URLMode setting
define('_SETTINGS_URLMODE',			'URL-l�ge');
define('_SETTINGS_URLMODE_NORMAL',	'Normal');
define('_SETTINGS_URLMODE_PATHINFO','Fancy');

// Batch operations
define('_BATCH_NOSELECTION',		'Inget valt att applicera f�r�ndringar p�');
define('_BATCH_ITEMS',				'Samk�r f�r�ndringar p� artiklar');
define('_BATCH_CATEGORIES',			'Samk�r f�r�ndringar p� kategorier');
define('_BATCH_MEMBERS',			'Samk�r f�r�ndringar p� medlemmar');
define('_BATCH_TEAM',				'Samk�r f�r�ndringar p� Team-medlemmar');
define('_BATCH_COMMENTS',			'Samk�r f�r�ndringar p� kommentarer');
define('_BATCH_UNKNOWN',			'Ogiltig f�r�ndring: ');
define('_BATCH_EXECUTING',			'Verkst�ller');
define('_BATCH_ONCATEGORY',			'p� kategori');
define('_BATCH_ONITEM',				'p� inl�gg');
define('_BATCH_ONCOMMENT',			'p� kommentar');
define('_BATCH_ONMEMBER',			'p� medlem');
define('_BATCH_ONTEAM',				'p� team-medlem');
define('_BATCH_SUCCESS',			'Det lyckades!');
define('_BATCH_DONE',				'Utf�rt!');
define('_BATCH_DELETE_CONFIRM',		'Bekr�fta borttagning');
define('_BATCH_DELETE_CONFIRM_BTN',	'Bekr�fta borttagning');
define('_BATCH_SELECTALL',			'v�lj alla');
define('_BATCH_DESELECTALL',		'avmarkera alla');

// batch operations: options in dropdowns
define('_BATCH_ITEM_DELETE',		'Ta bort');
define('_BATCH_ITEM_MOVE',			'Flytta');
define('_BATCH_MEMBER_DELETE',		'Ta bort');
define('_BATCH_MEMBER_SET_ADM',		'Ge admin-r�ttigheter');
define('_BATCH_MEMBER_UNSET_ADM',	'Ta ifr�n admin-r�ttigheter');
define('_BATCH_TEAM_DELETE',		'Ta bort fr�n team');
define('_BATCH_TEAM_SET_ADM',		'Ge admin-r�ttigheter');
define('_BATCH_TEAM_UNSET_ADM',		'Ta ifr�n admin-r�ttigheter');
define('_BATCH_CAT_DELETE',			'Ta bort');
define('_BATCH_CAT_MOVE',			'Flytta till annan blogg');
define('_BATCH_COMMENT_DELETE',		'Ta bort');

// itemlist: Add new item...
define('_ITEMLIST_ADDNEW',			'L�gg till ny inl�gg...');
define('_ADD_PLUGIN_EXTRAS',		'Extra inst�llningar f�r plug-in');

// errors
define('_ERROR_CATCREATEFAIL',		'Kunde inte skapa en ny kategori');
define('_ERROR_NUCLEUSVERSIONREQ',	'Denna plug-in kr�ver en nyare version av Nucleus: ');

// backlinks
define('_BACK_TO_BLOGSETTINGS',		'Tillbaka till inst�llningarna f�r bloggen');

// skin import export
define('_SKINIE_TITLE_IMPORT',		'Importera');
define('_SKINIE_TITLE_EXPORT',		'Exportera');
define('_SKINIE_BTN_IMPORT',		'Importera');
define('_SKINIE_BTN_EXPORT',		'Exportera valda skins/mallar');
define('_SKINIE_LOCAL',				'Importer fr�n en lokal fil:');
define('_SKINIE_NOCANDIDATES',		'Inga tillg�ngliga skins kunde importeras');
define('_SKINIE_FROMURL',			'Importera fr�n URL:');
define('_SKINIE_EXPORT_INTRO',		'V�lj vilka skins och mallar du vill exportera');
define('_SKINIE_EXPORT_SKINS',		'Skins');
define('_SKINIE_EXPORT_TEMPLATES',	'Mallar');
define('_SKINIE_EXPORT_EXTRA',		'Extra information');
define('_SKINIE_CONFIRM_OVERWRITE',	'Skriv �ver skins som redan existerar');
define('_SKINIE_CONFIRM_IMPORT',	'Ja, jag vill importera denna');
define('_SKINIE_CONFIRM_TITLE',		'Om importering');
define('_SKINIE_INFO_SKINS',		'Skins i filen');
define('_SKINIE_INFO_TEMPLATES',	'Mallar i filen');
define('_SKINIE_INFO_GENERAL',		'Information:');
define('_SKINIE_INFO_SKINCLASH',	'Skin-namn:');
define('_SKINIE_INFO_TEMPLCLASH',	'Mall-namn:');
define('_SKINIE_INFO_IMPORTEDSKINS','Importerade skins:');
define('_SKINIE_INFO_IMPORTEDTEMPLS','Importerade mallar:');
define('_SKINIE_DONE',				'Importeringen �r klar');

define('_AND',						'och');
define('_OR',						'eller');

// empty fields on template edit
define('_EDITTEMPLATE_EMPTY',		'tomt f�lt (klicka f�r att redigera)');

// skin overview list
define('_LIST_SKINS_INCMODE',		'Inkluderingsl�ge:');
define('_LIST_SKINS_INCPREFIX',		'Inkluderingsf�rstavelse:');
define('_LIST_SKINS_DEFINED',		'Definerade delar:');

// backup
define('_BACKUPS_TITLE',			'Backup / �terst�ll');
define('_BACKUP_TITLE',				'Backup');
define('_BACKUP_INTRO',				'Klicka p� knappen nedan f�r att skapa en backup av din Nucleus-databas. Du kommer att bli uppmanad att spara en fil. V�lj en s�ker plats.');
define('_BACKUP_ZIP_YES',			'F�rs�k att anv�nda komprimering');
define('_BACKUP_ZIP_NO',			'Anv�nd inte komprimering');
define('_BACKUP_BTN',				'Skapa backup');
define('_BACKUP_NOTE',				'<b>Notera:</b> Enbart inneh�llet i databasen blir sparat genom en backup. Mediafiler och inst�llningar i config.php blir d�remot <b>INTE</b> inkluderade');
define('_RESTORE_TITLE',			'Restore');
define('_RESTORE_NOTE',				'<b>VARNING:</b> �terst�llning fr�n en backup kommer att <b>RADERA</b> all aktuell data i databasen! G�r endast detta om du �r helt s�ker!	<br />	<b>Notera:</b> S�kerst�ll att versionen av Nucleus som du skapade din backup i �r samma som den du anv�nder nu! Annars kommer det inte att fungera');
define('_RESTORE_INTRO',			'V�lj backup-filen nedan (den kommer att laddas upp till servern) och klicka p� "�terst�ll" f�r att starta');
define('_RESTORE_IMSURE',			'Ja, jag vill utf�ra detta!');
define('_RESTORE_BTN',				'�terst�ll fr�n fil');
define('_RESTORE_WARNING',			'(s�kerst�ll att du v�ljer r�tt backup, g�r eventuellt en ytterligare backup innan)');
define('_ERROR_BACKUP_NOTSURE',		'Du beh�ver kryssa i boxen');
define('_RESTORE_COMPLETE',			'�terst�llning f�rdig');

// new item notification
define('_NOTIFY_NI_MSG',			'En ny inl�gg har blivit inlagd:');
define('_NOTIFY_NI_TITLE',			'Ny inl�gg!');
define('_NOTIFY_KV_MSG',			'Karma-r�sta p� inl�gg:');
define('_NOTIFY_KV_TITLE',			'Nucleus-karma:');
define('_NOTIFY_NC_MSG',			'Kommentera inl�gg:');
define('_NOTIFY_NC_TITLE',			'Nucleus-kommentar:');
define('_NOTIFY_USERID',			'Anv�ndar-ID:');
define('_NOTIFY_USER',				'Anv�ndare:');
define('_NOTIFY_COMMENT',			'Kommentar:');
define('_NOTIFY_VOTE',				'R�sta:');
define('_NOTIFY_HOST',				'Server:');
define('_NOTIFY_IP',				'IP-adress:');
define('_NOTIFY_MEMBER',			'Medlem:');
define('_NOTIFY_TITLE',				'Titel:');
define('_NOTIFY_CONTENTS',			'Inneh�ll:');

// member mail message
define('_MMAIL_MSG',				'Ett meddelande skickat till dig');
define('_MMAIL_FROMANON',			'en anonym bes�kare');
define('_MMAIL_FROMNUC',			'Inlagd fr�n en blogg p�');
define('_MMAIL_TITLE',				'Ett meddelande fr�n');
define('_MMAIL_MAIL',				'Meddelande:');

// END introduced after v1.5 END


// START introduced after v1.1 START

// bookmarklet buttons
define('_BMLET_ADD',				'L�gg till inl�gg');
define('_BMLET_EDIT',				'Redigera inl�gg');
define('_BMLET_DELETE',				'Ta bort inl�gg');
define('_BMLET_BODY',				'Body');
define('_BMLET_MORE',				'Ut�kad');
define('_BMLET_OPTIONS',			'Alternativ');
define('_BMLET_PREVIEW',			'F�rhandsgranska');

// used in bookmarklet
define('_ITEM_UPDATED',				'Inl�ggn uppdaterades');
define('_ITEM_DELETED',				'Inl�ggn raderades');

// plugins
define('_CONFIRMTXT_PLUGIN',		'�r du s�ker att du vill radera denna plug-in med namnet');
define('_ERROR_NOSUCHPLUGIN',		'Det finns ingen s�dan plug-in');
define('_ERROR_DUPPLUGIN',			'Denna plug-in �r redan installerad');
define('_ERROR_PLUGFILEERROR',		'Ingen s�dan plug-in existerar, eller ocks� beh�ver restriktionerna f�r�ndras "CHMOD"');
define('_PLUGS_NOCANDIDATES',		'Inga l�mpliga plug-ins hittades');

define('_PLUGS_TITLE_MANAGE',		'Hantera plug-ins');
define('_PLUGS_TITLE_INSTALLED',	'Installerade just nu');
define('_PLUGS_TITLE_UPDATE',		'Uppdatera prenumerationslista');
define('_PLUGS_TEXT_UPDATE',		'Nucleus cachar plug-ins. N�r du uppdaterar en plug-in genom att byta ut filen, m�ste du k�ra denna uppdatering f�r att r�tt prenumerationer ska cachas');
define('_PLUGS_TITLE_NEW',			'Installera ny plug-in');
define('_PLUGS_ADD_TEXT',			'Nedan finns en lista p� alla filer i din mapp, vilken kan inneh�lla icke installerade plug-ins. S�kerst�ll att det <strong>verkligen</strong> �r en plug-in innan du installerar den');
define('_PLUGS_BTN_INSTALL',		'Installera plug-in');
define('_BACKTOOVERVIEW',			'Tillbaka till �verblick');

// editlink
define('_TEMPLATE_EDITLINK',		'Redigera inl�ggns l�nk');

// add left / add right tooltips
define('_ADD_LEFT_TT',				'L�gg till en v�nsterbox');
define('_ADD_RIGHT_TT',				'L�gg till en h�gerbox');

// add/edit item: new category (in dropdown box)
define('_ADD_NEWCAT',				'Ny kategori...');

// new settings
define('_SETTINGS_PLUGINURL',		'Plug-in URL');
define('_SETTINGS_MAXUPLOADSIZE',	'Maximal filstorlek p� uploads (bytes)');
define('_SETTINGS_NONMEMBERMSGS',	'Till�t icke-medlemmar att skicka meddelanden');
define('_SETTINGS_PROTECTMEMNAMES',	'Skydda medlemsnamn');

// overview screen
define('_OVERVIEW_PLUGINS',			'Hantera plug-ins...');

// actionlog
define('_ACTIONLOG_NEWMEMBER',		'Ny medlemsregistrering:');

// membermail (when not logged in)
define('_MEMBERMAIL_MAIL',			'Din mejladress:');

// file upload
define('_ERROR_DISALLOWEDUPLOAD2',	'Du har inte admin-r�ttigheter. D�rf�r �r du inte till�ten att ladda upp filer till denna mapp');

// plugin list
define('_LISTS_INFO',				'Information');
define('_LIST_PLUGS_AUTHOR',		'Av:');
define('_LIST_PLUGS_VER',			'Version:');
define('_LIST_PLUGS_SITE',			'Bes�k sida');
define('_LIST_PLUGS_DESC',			'Beskrivning:');
define('_LIST_PLUGS_SUBS',			'L�ggs till p� f�ljande h�ndelser:');
define('_LIST_PLUGS_UP',			'flytta upp');
define('_LIST_PLUGS_DOWN',			'flytta ned');
define('_LIST_PLUGS_UNINSTALL',		'avinstallera');
define('_LIST_PLUGS_ADMIN',			'admin');
define('_LIST_PLUGS_OPTIONS',		'redigera&nbsp;alternativ');

// plugin option list
define('_LISTS_VALUE',				'V�rde');

// plugin options
define('_ERROR_NOPLUGOPTIONS',		'denna plug-in har inga valda alternativ');
define('_PLUGS_BACK',				'Tillbaka till �verblicken av plug-ins');
define('_PLUGS_SAVE',				'Spara alternativ');
define('_PLUGS_OPTIONS_UPDATED',	'Alternativen f�r plug-ins uppdaterades');

define('_OVERVIEW_MANAGEMENT',		'Hantering');
define('_OVERVIEW_MANAGE',			'Nucleus-hantering...');
define('_MANAGE_GENERAL',			'Generell hantering');
define('_MANAGE_SKINS',				'Skin och mallar');
define('_MANAGE_EXTRA',				'Extra tillval');

define('_BACKTOMANAGE',				'Tillbaka till Nucleus-hantering');


// END introduced after v1.1 END




// charset to use
define('_CHARSET',					'iso-8859-1');

// global stuff
define('_LOGOUT',					'Logga ut');
define('_LOGIN',					'Logga in');
define('_YES',						'Ja');
define('_NO',						'Nej');
define('_SUBMIT',					'Skicka');
define('_ERROR',					'Fel');
define('_ERRORMSG',					'Ett fel har intr�ffat!');
define('_BACK',						'G� tillbaka');
define('_NOTLOGGEDIN',				'Inte inloggad');
define('_LOGGEDINAS',				'Inloggad som');
define('_ADMINHOME',				'Admin Hem');
define('_NAME',						'Namn');
define('_BACKHOME',					'Tillbaka till Admin Hem');
define('_BADACTION',				'Ingen existerande h�ndelse �beropad');
define('_MESSAGE',					'Meddelande');
define('_HELP_TT',					'Hj�lp!');
define('_YOURSITE',					'Din webbsida');


define('_POPUP_CLOSE',				'St�ng f�nster');

define('_LOGIN_PLEASE',				'V�nligen logga in f�rst');

// commentform
define('_COMMENTFORM_YOUARE',		'Du �r');
define('_COMMENTFORM_SUBMIT',		'Kommentera');
define('_COMMENTFORM_COMMENT',		'Din kommentar');
define('_COMMENTFORM_NAME',			'Namn');
define('_COMMENTFORM_MAIL',			'Mejl/Webb');
define('_COMMENTFORM_REMEMBER',		'Kom ih�g mig');

// loginform
define('_LOGINFORM_NAME',			'Anv�ndarnamn');
define('_LOGINFORM_PWD',			'L�senord');
define('_LOGINFORM_YOUARE',			'Inloggad som');
define('_LOGINFORM_SHARED',			'Delad dator');

// member mailform
define('_MEMBERMAIL_SUBMIT',		'Skicka meddelande');

// search form
define('_SEARCHFORM_SUBMIT',		'S�k');

// add item form
define('_ADD_ADDTO',				'L�gg till ny inl�gg till');
define('_ADD_CREATENEW',			'Skapa ny inl�gg');
define('_ADD_BODY',					'Body');
define('_ADD_TITLE',				'Titel');
define('_ADD_MORE',					'Ut�kad text (valfri)');
define('_ADD_CATEGORY',				'Kategori');
define('_ADD_PREVIEW',				'F�rhandsgranska');
define('_ADD_DISABLE_COMMENTS',		'Inaktivera kommentarer?');
define('_ADD_DRAFTNFUTURE',			'Skissera &amp; framtida artiklar');
define('_ADD_ADDITEM',				'L�gg till inl�gg');
define('_ADD_ADDNOW',				'Publicera nu');
define('_ADD_ADDLATER',				'Publicera senare');
define('_ADD_PLACE_ON',				'Publicera p�');
define('_ADD_ADDDRAFT',				'L�gg till utkast');
define('_ADD_NOPASTDATES',			'(tidigare datum och tid �r inte giltiga, den aktuella tiden kommer att anv�ndas)');
define('_ADD_BOLD_TT',				'Fet');
define('_ADD_ITALIC_TT',			'Kursiv');
define('_ADD_HREF_TT',				'Skapa l�nk');
define('_ADD_MEDIA_TT',				'L�gg till media');
define('_ADD_PREVIEW_TT',			'Visa/D�lj f�rhandsgranskning');
define('_ADD_CUT_TT',				'Klipp ut');
define('_ADD_COPY_TT',				'Kopiera');
define('_ADD_PASTE_TT',				'Klistra in');


// edit item form
define('_EDIT_ITEM',				'Redigera inl�gg');
define('_EDIT_SUBMIT',				'Redigera inl�gg');
define('_EDIT_ORIG_AUTHOR',			'Ursprunglig f�rfattare');
define('_EDIT_BACKTODRAFTS',		'L�gg till utkast');
define('_EDIT_COMMENTSNOTE',		'(notera: inaktivering av kommentarer kommer inte d�lja tidigare kommentarer)');

// used on delete screens
define('_DELETE_CONFIRM',			'V�nligen bekr�fta borttagning');
define('_DELETE_CONFIRM_BTN',		'Bekr�fta borttagning');
define('_CONFIRMTXT_ITEM',			'Du �r p� v�g att radera f�ljande artiklar:');
define('_CONFIRMTXT_COMMENT',		'Du kommer att radera f�ljande kommentarer:');
define('_CONFIRMTXT_TEAM1',			'Du kommer att radera ');
define('_CONFIRMTXT_TEAM2',			' fr�n team-listan f�r bloggen ');
define('_CONFIRMTXT_BLOG',			'Bloggen du kommer att radera �r: ');
define('_WARNINGTXT_BLOGDEL',		'Varning! Borttagning av en blogg kommer att radera alla artiklar och kommentarer. V�nligen bekr�fta!<br />Avbryt inte borttagningsprocessen.');
define('_CONFIRMTXT_MEMBER',		'Du kommer att tabort f�ljande medlemsprofil: ');
define('_CONFIRMTXT_TEMPLATE',		'Du kommer att ta bort mallen med namnet ');
define('_CONFIRMTXT_SKIN',			'Du kommer att ta bort skin med namnet ');
define('_CONFIRMTXT_BAN',			'Du kommer att ta bort bannen f�r ip-serien ');
define('_CONFIRMTXT_CATEGORY',		'Du kommer att ta bort kategorin ');

// some status messages
define('_DELETED_ITEM',				'Inl�gg raderad');
define('_DELETED_MEMBER',			'Medlem raderad');
define('_DELETED_COMMENT',			'Kommentar raderad');
define('_DELETED_BLOG',				'Blogg raderad');
define('_DELETED_CATEGORY',			'Kategori raderad');
define('_ITEM_MOVED',				'Inl�gg flyttad');
define('_ITEM_ADDED',				'Inl�gg publicerad');
define('_COMMENT_UPDATED',			'Kommentar uppdaterad');
define('_SKIN_UPDATED',				'Skin-egenskaper har sparats');
define('_TEMPLATE_UPDATED',			'Mallegenskaper har sparats');

// errors
define('_ERROR_COMMENT_LONGWORD',	'Anv�nd inte ord l�ngre �n 90 tecken');
define('_ERROR_COMMENT_NOCOMMENT',	'V�nligen skriv en kommentar');
define('_ERROR_COMMENT_NOUSERNAME',	'Ogiltigt anv�ndarnamn');
define('_ERROR_COMMENT_TOOLONG',	'Dina kommentarer �r f�r l�nga (max. 5000 tecken)');
define('_ERROR_COMMENTS_DISABLED',	'Kommentarer �r f�r tillf�llet inaktiverade.');
define('_ERROR_COMMENTS_NONPUBLIC',	'Du m�ste vara inloggad som medlem f�r att kommentera');
define('_ERROR_COMMENTS_MEMBERNICK','Namnet �r upptaget av en medlem. V�lj n�got annat.');
define('_ERROR_SKIN',				'Skin-fel');
define('_ERROR_ITEMCLOSED',			'Denna inl�gg �r st�ngd. Du kan inte kommentera/r�sta.');
define('_ERROR_NOSUCHITEM',			'Inget s�dant inl�gg existerar');
define('_ERROR_NOSUCHBLOG',			'Det finns ingen s�dan blogg');
define('_ERROR_NOSUCHSKIN',			'Det finns inget s�dant skin');
define('_ERROR_NOSUCHMEMBER',		'Det finns ingen s�dan medlem');
define('_ERROR_NOTONTEAM',			'Du tillh�r inte team-listan.');
define('_ERROR_BADDESTBLOG',		'Destinationsbloggen existerar inte');
define('_ERROR_NOTONDESTTEAM',		'Kan inte flytta, eftersom du inte tillh�r team-listan');
define('_ERROR_NOEMPTYITEMS',		'Kan inte l�gga till tomma element!');
define('_ERROR_BADMAILADDRESS',		'Mejladressen �r ogiltig');
define('_ERROR_BADNOTIFY',			'En eller flera av mottagaradresserna �r ogiltiga');
define('_ERROR_BADNAME',			'Namnet �r ogiltigt (a-z och 0-9 till�tna, inga mellanslag)');
define('_ERROR_NICKNAMEINUSE',		'Namnet �r upptaget av en annan medlem');
define('_ERROR_PASSWORDMISMATCH',	'L�senorden m�ste st�mma �verens');
define('_ERROR_PASSWORDTOOSHORT',	'L�senordet m�ste inneh�lla minst 6 tecken');
define('_ERROR_PASSWORDMISSING',	'L�senordet kan inte vara blankt');
define('_ERROR_REALNAMEMISSING',	'Du m�ste skriva ett riktigt namn');
define('_ERROR_ATLEASTONEADMIN',	'Det m�ste finnas �tminstone en super-admin som kan logga in till admin-arean.');
define('_ERROR_ATLEASTONEBLOGADMIN','Att utf�ra denna �tg�rd skulle g�ra din blogg ohanterbar. Det m�ste finnas minst en admin.');
define('_ERROR_ALREADYONTEAM',		'Du kan inte l�gga till en medlem som redan finns i teamet');
define('_ERROR_BADSHORTBLOGNAME',	'Bloggens korta namn kan bara inneh�lla a-z och 0-9, inga mellanslag');
define('_ERROR_DUPSHORTBLOGNAME',	'En annan blogg anv�nder redan det korta bloggnamnet. Dessa namn m�ste vara unika.');
define('_ERROR_UPDATEFILE',			'Kan inte skriva till filen. Prova att �ndra CHMOD (666)');
define('_ERROR_DELDEFBLOG',			'Kan inte ta bort standardbloggen');
define('_ERROR_DELETEMEMBER',		'Kan inte ta bort denna medlem, f�rmodligen d�rf�r att han/hon �r f�rfattare');
define('_ERROR_BADTEMPLATENAME',	'Ogiltigt namn f�r mall, anv�nd endast a-z och 0-9, inga mellanslag');
define('_ERROR_DUPTEMPLATENAME',	'Det finns redan en mall med detta namn');
define('_ERROR_BADSKINNAME',		'Ogiltigt namn f�r detta skin (endast a-z, 0-9 �r till�tna, inga mellanslag)');
define('_ERROR_DUPSKINNAME',		'Det finns redan ett skin med detta namn');
define('_ERROR_DEFAULTSKIN',		'Det m�ste alltid finnas ett skin med namnet "default"');
define('_ERROR_SKINDEFDELETE',		'Kan inte radera skin, eftersom det �r standard f�r f�ljande bloggar: ');
define('_ERROR_DISALLOWED',			'Du �r inte beh�rig att utf�ra denna �tg�rd');
define('_ERROR_DELETEBAN',			'Kan inte radera bannen (den existerar inte)');
define('_ERROR_ADDBAN',				'Kan inte banna.');
define('_ERROR_BADACTION',			'Vald �tg�rd existerar inte');
define('_ERROR_MEMBERMAILDISABLED',	'Meddelanden mellan medlemmar �r inaktiverade');
define('_ERROR_MEMBERCREATEDISABLED','Skapande av medlemmar �r inaktiverat');
define('_ERROR_INCORRECTEMAIL',		'Felaktig mejladress');
define('_ERROR_VOTEDBEFORE',		'Du har redan r�stat');
define('_ERROR_BANNED1',			'Kan inte utf�ra detta eftersom du (IP ');
define('_ERROR_BANNED2',			') �r sp�rrad. Meddelande: \'');
define('_ERROR_BANNED3',			'\'');
define('_ERROR_LOGINNEEDED',		'Du m�ste vara inloggad f�r att utf�ra denna �tg�rd');
define('_ERROR_CONNECT',			'Fel vid anslutning');
define('_ERROR_FILE_TOO_BIG',		'Filen �r f�r stor!');
define('_ERROR_BADFILETYPE',		'Tyv�rr, detta filformat �r inte till�tet');
define('_ERROR_BADREQUEST',			'Felaktigt uppladdningsf�rfarande');
define('_ERROR_DISALLOWEDUPLOAD',	'Du finns inte med i n�got blogg-team. D�rf�r kan du inte ladda upp filer');
define('_ERROR_BADPERMISSIONS',		'Fil- eller mappr�ttigheterna �r inte korrekt anpassade');
define('_ERROR_UPLOADMOVEP',		'Fel vid uppladdning av fil');
define('_ERROR_UPLOADCOPY',			'Fel vid kopiering');
define('_ERROR_UPLOADDUPLICATE',	'Det finns redan en fil med det namnet. Prova att byta namn innan uppladdning.');
define('_ERROR_LOGINDISALLOWED',	'Tyv�rr, du �r inte till�ten att logga in som admin.');
define('_ERROR_DBCONNECT',			'Kunde inte ansluta till MySQL-servern');
define('_ERROR_DBSELECT',			'Kunde inte v�lja Nucleus databas.');
define('_ERROR_NOSUCHLANGUAGE',		'Det existerar inte s�dan spr�kfil');
define('_ERROR_NOSUCHCATEGORY',		'Det finns ingen s�dan kategori');
define('_ERROR_DELETELASTCATEGORY',	'Det m�ste finnas �tminstone en kategori');
define('_ERROR_DELETEDEFCATEGORY',	'Kan inte radera standardkategorin');
define('_ERROR_BADCATEGORYNAME',	'Felaktigt kategorinamn');
define('_ERROR_DUPCATEGORYNAME',	'Det finns redan en kategori med detta namn');

// some warnings (used for mediadir setting)
define('_WARNING_NOTADIR',			'Varning: Aktuellt v�rde �r inte en mapp!');
define('_WARNING_NOTREADABLE',		'Varning: Aktuellt v�rde �r en skrivskyddad mapp!');
define('_WARNING_NOTWRITABLE',		'Varning: Aktuellt v�rde INTE en skrivbar mapp!');

// media and upload
define('_MEDIA_UPLOADLINK',			'Ladda upp en ny fil');
define('_MEDIA_MODIFIED',			'f�r�ndrad');
define('_MEDIA_FILENAME',			'filnamn');
define('_MEDIA_DIMENSIONS',			'storlek');
define('_MEDIA_INLINE',				'Inline');
define('_MEDIA_POPUP',				'Pop-up');
define('_UPLOAD_TITLE',				'V�lj fil');
define('_UPLOAD_MSG',				'V�lj fil att ladda upp och klicka p� knappen.');
define('_UPLOAD_BUTTON',			'Ladda upp');

// some status messages
//define('_MSG_ACCOUNTCREATED',		'Kontot skapades, l�senordet kommer att skickas via mejl');
//define('_MSG_PASSWORDSENT',			'L�senordet har skickats via mejl.');
define('_MSG_LOGINAGAIN',			'Du m�ste logga in igen');
define('_MSG_SETTINGSCHANGED',		'Inst�llningarna �ndrades');
define('_MSG_ADMINCHANGED',			'Admin �ndrades');
define('_MSG_NEWBLOG',				'Ny blogg skapades');
define('_MSG_ACTIONLOGCLEARED',		'H�ndelse-loggen rensad');

// actionlog in admin area
define('_ACTIONLOG_DISALLOWED',		'F�rbjuden �tg�rd: ');
define('_ACTIONLOG_PWDREMINDERSENT','Nytt l�senord skickat till ');
define('_ACTIONLOG_TITLE',			'H�ndelse-logg');
define('_ACTIONLOG_CLEAR_TITLE',	'Rensa h�ndelse-logg');
define('_ACTIONLOG_CLEAR_TEXT',		'Rensa loggboken nu');

// team management
define('_TEAM_TITLE',				'Hantera bloggens team ');
define('_TEAM_CURRENT',				'Aktuellt team');
define('_TEAM_ADDNEW',				'L�gg till en ny medlem i ett team');
define('_TEAM_CHOOSEMEMBER',		'V�lj medlem');
define('_TEAM_ADMIN',				'Admin-r�ttigheter? ');
define('_TEAM_ADD',					'L�gg till i team');
define('_TEAM_ADD_BTN',				'L�gg till');

// blogsettings
define('_EBLOG_TITLE',				'Redigera bloggens inst�llningar');
define('_EBLOG_TEAM_TITLE',			'Redigera team');
define('_EBLOG_TEAM_TEXT',			'Klicka h�r f�r att redigera team...');
define('_EBLOG_SETTINGS_TITLE',		'Inst�llningar f�r blogg');
define('_EBLOG_NAME',				'Bloggens namn');
define('_EBLOG_SHORTNAME',			'Kort blogg-namn');
define('_EBLOG_SHORTNAME_EXTRA',	'<br />(kan bara inneh�lla a-z, inga mellanslag)');
define('_EBLOG_DESC',				'Beskrivning f�r blogg');
define('_EBLOG_URL',				'URL');
define('_EBLOG_DEFSKIN',			'Standard-Skin');
define('_EBLOG_DEFCAT',				'Standardkategori');
define('_EBLOG_LINEBREAKS',			'Konvertera radbrytningar');
define('_EBLOG_DISABLECOMMENTS',	'Aktivera m�jligheten att kommentera?');
define('_EBLOG_ANONYMOUS',			'Till�t kommentarer av icke-medlemmar?');
define('_EBLOG_NOTIFY',				'Underr�ttelse-address(er) (anv�nd ; som avskiljare)');
define('_EBLOG_NOTIFY_ON',			'Underr�tta vid');
define('_EBLOG_NOTIFY_COMMENT',		'Ny kommentar');
define('_EBLOG_NOTIFY_KARMA',		'Ny karma-r�st');
define('_EBLOG_NOTIFY_ITEM',		'Nytt blogg-inl�gg');
define('_EBLOG_PING',				'Pinga Weblogs.com vid uppdatering?');
define('_EBLOG_MAXCOMMENTS',		'St�rsta andelen kommentarer');
define('_EBLOG_UPDATE',				'Uppdatera fil');
define('_EBLOG_OFFSET',				'Tid offset');
define('_EBLOG_STIME',				'Aktuell tid p� servern �r');
define('_EBLOG_BTIME',				'Aktuell tid i bloggen �r');
define('_EBLOG_CHANGE',				'�ndra inst�llningar');
define('_EBLOG_CHANGE_BTN',			'�ndra inst�llningar');
define('_EBLOG_ADMIN',				'Blogg Admin');
define('_EBLOG_ADMIN_MSG',			'Du kommer att till�gnas admin-r�ttigheter');
define('_EBLOG_CREATE_TITLE',		'Skapa ny blogg');
define('_EBLOG_CREATE_TEXT',		'Fyll i formul�ret f�r att skapa en ny blogg. <br /><br /> <b>Notera:</b> Endast de n�dv�ndiga alternativen finns med. Om du vill �ndra avancerade inst�llningar, g� in i bloggens sida efter skapandet.');
define('_EBLOG_CREATE',				'Skapa!');
define('_EBLOG_CREATE_BTN',			'Skapa blogg');
define('_EBLOG_CAT_TITLE',			'Kategorier');
define('_EBLOG_CAT_NAME',			'Kategorinamn');
define('_EBLOG_CAT_DESC',			'Beskrivning av kategorin');
define('_EBLOG_CAT_CREATE',			'Skapa ny kategori');
define('_EBLOG_CAT_UPDATE',			'Uppdatera kategorin');
define('_EBLOG_CAT_UPDATE_BTN',		'Uppdatera kategorin');

// templates
define('_TEMPLATE_TITLE',			'Redigera mallar');
define('_TEMPLATE_AVAILABLE_TITLE',	'Tillg�ngliga mallar');
define('_TEMPLATE_NEW_TITLE',		'Ny mall');
define('_TEMPLATE_NAME',			'Mallens namn');
define('_TEMPLATE_DESC',			'Mallens beskrivning');
define('_TEMPLATE_CREATE',			'Skapa mall');
define('_TEMPLATE_CREATE_BTN',		'Skapa mall');
define('_TEMPLATE_EDIT_TITLE',		'Redigera mall');
define('_TEMPLATE_BACK',			'Tillbaka till �versikten av mallar');
define('_TEMPLATE_EDIT_MSG',		'Alla malldelar beh�vs inte, l�mna icke n�dv�ndiga f�lt tomma.');
define('_TEMPLATE_SETTINGS',		'Mallinst�llningar');
define('_TEMPLATE_ITEMS',			'Inl�gg');
define('_TEMPLATE_ITEMHEADER',		'Inl�ggns header');
define('_TEMPLATE_ITEMBODY',		'Body');
define('_TEMPLATE_ITEMFOOTER',		'Inl�ggns footer');
define('_TEMPLATE_MORELINK',		'L�nk till ut�kat inl�gg');
define('_TEMPLATE_NEW',				'Indikering av nya inl�gg');
define('_TEMPLATE_COMMENTS_ANY',	'Kommentarer (eventuellt)');
define('_TEMPLATE_CHEADER',			'Kommentarers header');
define('_TEMPLATE_CBODY',			'Kommentarers body');
define('_TEMPLATE_CFOOTER',			'Kommentarers footer');
define('_TEMPLATE_CONE',			'En kommentar');
define('_TEMPLATE_CMANY',			'Tv� eller flera kommentarer');
define('_TEMPLATE_CMORE',			'Kommentarernas l�s mer');
define('_TEMPLATE_CMEXTRA',			'Extra f�r medlem');
define('_TEMPLATE_COMMENTS_NONE',	'Kommentarer (om det saknas)');
define('_TEMPLATE_CNONE',			'Inga kommentarer');
define('_TEMPLATE_COMMENTS_TOOMUCH','Kommentarer (om det finns, men f�r m�nga f�r att visa)');
define('_TEMPLATE_CTOOMUCH',		'F�r m�nga kommentarer');
define('_TEMPLATE_ARCHIVELIST',		'Arkivlista');
define('_TEMPLATE_AHEADER',			'Arkivlistans header');
define('_TEMPLATE_AITEM',			'Arkivlistans inl�gg');
define('_TEMPLATE_AFOOTER',			'Arkivlistans footer');
define('_TEMPLATE_DATETIME',		'Datum och tid');
define('_TEMPLATE_DHEADER',			'Datumets header');
define('_TEMPLATE_DFOOTER',			'Datumets footer');
define('_TEMPLATE_DFORMAT',			'Datumets format');
define('_TEMPLATE_TFORMAT',			'Tidsformat');
define('_TEMPLATE_LOCALE',			'Lokal');
define('_TEMPLATE_IMAGE',			'Bild-popup');
define('_TEMPLATE_PCODE',			'K�llkod f�r popups');
define('_TEMPLATE_ICODE',			'K�llkod f�r Inline-bilder');
define('_TEMPLATE_MCODE',			'K�llkod f�r mediaobjekt');
define('_TEMPLATE_SEARCH',			'S�k');
define('_TEMPLATE_SHIGHLIGHT',		'Markering/Highlight');
define('_TEMPLATE_SNOTFOUND',		'Inga tr�ffar hittades');
define('_TEMPLATE_UPDATE',			'Uppdatera');
define('_TEMPLATE_UPDATE_BTN',		'Uppdatera mall');
define('_TEMPLATE_RESET_BTN',		'Rensa data');
define('_TEMPLATE_CATEGORYLIST',	'Kategorilista');
define('_TEMPLATE_CATHEADER',		'Kategorilista header');
define('_TEMPLATE_CATITEM',			'Kategorilista inl�gg');
define('_TEMPLATE_CATFOOTER',		'Kategorilista footer');

// skins
define('_SKIN_EDIT_TITLE',			'Redigera Skins');
define('_SKIN_AVAILABLE_TITLE',		'Tillg�ngliga Skins');
define('_SKIN_NEW_TITLE',			'Nytt Skin');
define('_SKIN_NAME',				'Namn');
define('_SKIN_DESC',				'Beskrivning');
define('_SKIN_TYPE',				'Typ av inneh�ll');
define('_SKIN_CREATE',				'Skapa');
define('_SKIN_CREATE_BTN',			'Skapa Skin');
define('_SKIN_EDITONE_TITLE',		'Redigera skin');
define('_SKIN_BACK',				'Tilbaka �verblicken av Skins');
define('_SKIN_PARTS_TITLE',			'Skin-delar');
define('_SKIN_PARTS_MSG',			'Alla alternativ �r inte n�dv�ndiga.');
define('_SKIN_PART_MAIN',			'Main Index');
define('_SKIN_PART_ITEM',			'Inl�gg');
define('_SKIN_PART_ALIST',			'Arkivlista');
define('_SKIN_PART_ARCHIVE',		'Arkiv');
define('_SKIN_PART_SEARCH',			'S�k');
define('_SKIN_PART_ERROR',			'Fel');
define('_SKIN_PART_MEMBER',			'Medlemsdetaljer');
define('_SKIN_PART_POPUP',			'Bild-popups');
define('_SKIN_GENSETTINGS_TITLE',	'Generella inst�llningar');
define('_SKIN_CHANGE',				'�ndra');
define('_SKIN_CHANGE_BTN',			'�ndra inst�llningarna');
define('_SKIN_UPDATE_BTN',			'Uppdatera Skin');
define('_SKIN_RESET_BTN',			'Rensa data');
define('_SKIN_EDITPART_TITLE',		'Redigera Skin');
define('_SKIN_GOBACK',				'G� tillbaka');
define('_SKIN_ALLOWEDVARS',			'Till�tna variabler (klicka f�r info):');

// global settings
define('_SETTINGS_TITLE',			'Generella inst�llningar');
define('_SETTINGS_SUB_GENERAL',		'Generella inst�llningar');
define('_SETTINGS_DEFBLOG',			'Standardblogg');
define('_SETTINGS_ADMINMAIL',		'Admins mejl');
define('_SETTINGS_SITENAME',		'Sidnamn');
define('_SETTINGS_SITEURL',			'Sidans URL (ska avslutas med snedstreck)');
define('_SETTINGS_ADMINURL',		'Admin-sidans URL (ska avslutas med snedstreck)');
define('_SETTINGS_DIRS',			'Nucleus mappar');
define('_SETTINGS_MEDIADIR',		'Mediamapp');
define('_SETTINGS_SEECONFIGPHP',	'(se config.php)');
define('_SETTINGS_MEDIAURL',		'Media URL (ska avslutas med snedstreck)');
define('_SETTINGS_ALLOWUPLOAD',		'Till�t uppladdning av filer?');
define('_SETTINGS_ALLOWUPLOADTYPES','Till�tna filtyper');
define('_SETTINGS_CHANGELOGIN',		'Till�t medlemmar att �ndra namn/l�senord');
define('_SETTINGS_COOKIES_TITLE',	'Cookie-inst�llningar');
define('_SETTINGS_COOKIELIFE',		'Livstid f�r inloggnings-cookies');
define('_SETTINGS_COOKIESESSION',	'Session-cookies');
define('_SETTINGS_COOKIEMONTH',		'En m�nad');
define('_SETTINGS_COOKIEPATH',		'Cookie-s�kv�g (avancerad)');
define('_SETTINGS_COOKIEDOMAIN',	'Cookie-dom�n (avancerad)');
define('_SETTINGS_COOKIESECURE',	'S�ker cookie (avancerad)');
define('_SETTINGS_LASTVISIT',		'Spara cookies fr�n senaste bes�k');
define('_SETTINGS_ALLOWCREATE',		'Till�t bes�kare att skapa medlemskonton');
define('_SETTINGS_NEWLOGIN',		'Inloggning till�ten f�r skapade konton');
define('_SETTINGS_NEWLOGIN2',		'(endast f�r nya konton)');
define('_SETTINGS_MEMBERMSGS',		'Till�t medlemsinteraktion');
define('_SETTINGS_LANGUAGE',		'Standardspr�k');
define('_SETTINGS_DISABLESITE',		'Inaktivera webbsidan');
define('_SETTINGS_DBLOGIN',			'Inloggning f�r MySQL &amp; databas');
define('_SETTINGS_UPDATE',			'Uppdatera inst�llningar');
define('_SETTINGS_UPDATE_BTN',		'Uppdatera inst�llningar');
define('_SETTINGS_DISABLEJS',		'Inaktivera verktygsf�lt i Java');
define('_SETTINGS_MEDIA',			'Inst�llningar f�r mediauppladdning');
define('_SETTINGS_MEDIAPREFIX',		'F�rstava uppladdade filer med datum');
define('_SETTINGS_MEMBERS',			'Medlemsinst�llningar');

// bans
define('_BAN_TITLE',				'Ban-lista f�r');
define('_BAN_NONE',					'Inga bannar f�r denna blogg');
define('_BAN_NEW_TITLE',			'L�gg till ban');
define('_BAN_NEW_TEXT',				'L�gg till en ban nu');
define('_BAN_REMOVE_TITLE',			'Ta bort ban');
define('_BAN_IPRANGE',				'IP-serie');
define('_BAN_BLOGS',				'Vilken blogg?');
define('_BAN_DELETE_TITLE',			'Ta bort ban');
define('_BAN_ALLBLOGS',				'Alla bloggar som du har admin-r�ttgheter f�r.');
define('_BAN_REMOVED_TITLE',		'Bannen borttagen');
define('_BAN_REMOVED_TEXT',			'Bannentogs bort i f�ljande bloggar:');
define('_BAN_ADD_TITLE',			'L�gg till ban');
define('_BAN_IPRANGE_TEXT',			'V�lj IP-serie som du vill sp�rra.');
define('_BAN_BLOGS_TEXT',			'Du kan v�lja att banna i en blogg eller alla bloggar som du �r admin f�r.');
define('_BAN_REASON_TITLE',			'Anledning');
define('_BAN_REASON_TEXT',			'Du kan motivera bannen, vilken sedan visas f�r den aktuella personen.');
define('_BAN_ADD_BTN',				'L�gg till ban');

// LOGIN screen
define('_LOGIN_MESSAGE',			'Meddelande');
define('_LOGIN_NAME',				'Namn');
define('_LOGIN_PASSWORD',			'L�senord');
define('_LOGIN_SHARED',				_LOGINFORM_SHARED);
define('_LOGIN_FORGOT',				'Gl�mt l�senordet?');

// membermanagement
define('_MEMBERS_TITLE',			'Medlemshantering');
define('_MEMBERS_CURRENT',			'Aktuella medlemmar');
define('_MEMBERS_NEW',				'Ny medlem');
define('_MEMBERS_DISPLAY',			'Sk�rmnamn');
define('_MEMBERS_DISPLAY_INFO',		'(inloggningsnamn)');
define('_MEMBERS_REALNAME',			'Verkligt namn');
define('_MEMBERS_PWD',				'L�senord');
define('_MEMBERS_REPPWD',			'Bekr�fta l�senord');
define('_MEMBERS_EMAIL',			'Mejladress');
define('_MEMBERS_EMAIL_EDIT',		'(Om du �ndrar mejladress, kommer ett nytt l�senord att skickas ut)');
define('_MEMBERS_URL',				'Hemsideadress (URL)');
define('_MEMBERS_SUPERADMIN',		'Admin-r�ttigheter');
define('_MEMBERS_CANLOGIN',			'Kan logga in till admin');
define('_MEMBERS_NOTES',			'Noteringar');
define('_MEMBERS_NEW_BTN',			'L�gg till medlem');
define('_MEMBERS_EDIT',				'Redigera medlem');
define('_MEMBERS_EDIT_BTN',			'�ndra inst�llningar');
define('_MEMBERS_BACKTOOVERVIEW',	'Tillbaka till medlems�versikten');
define('_MEMBERS_DEFLANG',			'Spr�k');
define('_MEMBERS_USESITELANG',		'- anv�nd sidans inst�llningar -');

// List of blogs (TT = tooltip)
define('_BLOGLIST_TT_VISIT',		'Bes�k sida');
define('_BLOGLIST_ADD',				'L�gg till inl�gg');
define('_BLOGLIST_TT_ADD',			'L�gg till inl�gg i denna blogg');
define('_BLOGLIST_EDIT',			'Redigera/ta bort inl�gg');
define('_BLOGLIST_TT_EDIT',			'');
define('_BLOGLIST_BMLET',			'Bokm�rke');
define('_BLOGLIST_TT_BMLET',		'');
define('_BLOGLIST_SETTINGS',		'Inst�llningar');
define('_BLOGLIST_TT_SETTINGS',		'Redigera inst�llningarna eller hantera team');
define('_BLOGLIST_BANS',			'Bannar');
define('_BLOGLIST_TT_BANS',			'Visa, l�gg till eller ta bort bannade IP');
define('_BLOGLIST_DELETE',			'Radera alla');
define('_BLOGLIST_TT_DELETE',		'Radera denna blogg');

// OVERVIEW screen
define('_OVERVIEW_YRBLOGS',			'Dina bloggar');
define('_OVERVIEW_YRDRAFTS',		'Dina utkast');
define('_OVERVIEW_YRSETTINGS',		'Dina inst�llningar');
define('_OVERVIEW_GSETTINGS',		'Generella inst�llningar');
define('_OVERVIEW_NOBLOGS',			'Du tillh�r inte n�gon bloggs teamlista');
define('_OVERVIEW_NODRAFTS',		'Inga utkast');
define('_OVERVIEW_EDITSETTINGS',	'Redigera dina inst�llningar...');
define('_OVERVIEW_BROWSEITEMS',		'Bl�ddra bland dina inl�gg...');
define('_OVERVIEW_BROWSECOMM',		'Bl�ddra bland dina kommentarer...');
define('_OVERVIEW_VIEWLOG',			'Visa h�ndelse-logg...');
define('_OVERVIEW_MEMBERS',			'Hantera medlemmar...');
define('_OVERVIEW_NEWLOG',			'Skapa ny blogg...');
define('_OVERVIEW_SETTINGS',		'Redigera inst�llningar...');
define('_OVERVIEW_TEMPLATES',		'Redigera mallar...');
define('_OVERVIEW_SKINS',			'Redigera Skins...');
define('_OVERVIEW_BACKUP',			'Backup/�terst�ll...');

// ITEMLIST
define('_ITEMLIST_BLOG',			'Inl�gg i bloggen');
define('_ITEMLIST_YOUR',			'Dina inl�gg');

// Comments
define('_COMMENTS',					'Kommentarer');
define('_NOCOMMENTS',				'Inga kommentarer p� detta inl�gg');
define('_COMMENTS_YOUR',			'Dina kommentarer');
define('_NOCOMMENTS_YOUR',			'Du har inte skrivit n�gra kommentarer');

// LISTS (general)
define('_LISTS_NOMORE',				'Inga fler resultat, eller inga resultat �verhuvutaget');
define('_LISTS_PREV',				'F�reg�ende');
define('_LISTS_NEXT',				'N�sta');
define('_LISTS_SEARCH',				'S�k');
define('_LISTS_CHANGE',				'�ndra');
define('_LISTS_PERPAGE',			'inl�gg/sida');
define('_LISTS_ACTIONS',			'H�ndelser');
define('_LISTS_DELETE',				'Radera');
define('_LISTS_EDIT',				'Redigera');
define('_LISTS_MOVE',				'Flytta');
define('_LISTS_CLONE',				'Klona');
define('_LISTS_TITLE',				'Titel');
define('_LISTS_BLOG',				'Blogg');
define('_LISTS_NAME',				'Namn');
define('_LISTS_DESC',				'Beskrivning');
define('_LISTS_TIME',				'Tid');
define('_LISTS_COMMENTS',			'Kommentarer');
define('_LISTS_TYPE',				'Typ');


// member list
define('_LIST_MEMBER_NAME',			'Sk�rmnamn');
define('_LIST_MEMBER_RNAME',		'Verkligt namn');
define('_LIST_MEMBER_ADMIN',		'Super-admin? ');
define('_LIST_MEMBER_LOGIN',		'Kan logga in? ');
define('_LIST_MEMBER_URL',			'Webbsida');

// banlist
define('_LIST_BAN_IPRANGE',			'IP-serie');
define('_LIST_BAN_REASON',			'Anledning');

// actionlist
define('_LIST_ACTION_MSG',			'Meddelande');

// commentlist
define('_LIST_COMMENT_BANIP',		'Banna IP');
define('_LIST_COMMENT_WHO',			'F�rfattare');
define('_LIST_COMMENT',				'Kommentar');
define('_LIST_COMMENT_HOST',		'V�rd');

// itemlist
define('_LIST_ITEM_INFO',			'Info');
define('_LIST_ITEM_CONTENT',		'Titel och text');


// teamlist
define('_LIST_TEAM_ADMIN',			'Admin ');
define('_LIST_TEAM_CHADMIN',		'�ndra Admin');

// edit comments
define('_EDITC_TITLE',				'Redigera kommentarer');
define('_EDITC_WHO',				'F�rfattare');
define('_EDITC_HOST',				'Varifr�n?');
define('_EDITC_WHEN',				'N�r?');
define('_EDITC_TEXT',				'Text');
define('_EDITC_EDIT',				'Redigera kommentar');
define('_EDITC_MEMBER',				'medlem');
define('_EDITC_NONMEMBER',			'icke-medlem');

// move item
define('_MOVE_TITLE',				'Flytta till vilken blogg?');
define('_MOVE_BTN',					'Flytta');

?>


