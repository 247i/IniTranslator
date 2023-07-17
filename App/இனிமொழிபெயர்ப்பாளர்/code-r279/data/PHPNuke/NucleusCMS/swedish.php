<?php
// Swedish Nucleus Language File
// Svensk språkfil
//
// Author: Johan Österström
// Website: www.osterstrom.nu
// E-mail: johan@osterstrom.nu
// FEEL FREE TO SEND AN E-MAIL IF YOU USE THIS LANGUAGE-FILE!
// {-- Rösta för maktskifte 2006 --}
// Nucleus version: v1.0-v3.2
//


// START changed/added after 3.15 START

define('_LIST_PLUG_SUBS_NEEDUPDATE','Vänligen använd knappen för att uppdatera.');
define('_LIST_PLUGS_DEP',			'Plugin(s) kräver:');

// END changed/added after 3.15

// START changed/added after 3.1 START

// comments list per weblog
define('_COMMENTS_BLOG',			'Alla kommentarer på bloggen');
define('_NOCOMMENTS_BLOG',			'Inga kommentarer har lämnats');
define('_BLOGLIST_COMMENTS',		'Kommentarer');
define('_BLOGLIST_TT_COMMENTS',		'En lista på alla kommentarer i denna bloggen');


// for use in archivetype-skinvar
define('_ARCHIVETYPE_DAY',			'dag');
define('_ARCHIVETYPE_MONTH',		'månad');

// tickets (prevents malicious users to trick an admin to perform actions he doesn't want)
define('_ERROR_BADTICKET',			'Ogiltig handling.');

// plugin dependency
define('_ERROR_INSREQPLUGIN',		'Installationen av en plug-in misslyckades, den kräver ');
define('_ERROR_DELREQPLUGIN',		'Avinstallationen av en plug-in misslyckades, ');

// cookie prefix
define('_SETTINGS_COOKIEPREFIX',	'Cookie-förstavelse');

// account activation
define('_ERROR_NOLOGON_NOACTIVATE',	'Kan inte skicka aktiveringskoden. Du är inte tillåten att logga in.');
define('_ERROR_ACTIVATE',			'Aktiveringsnyckeln existerar inte, är felaktig eller har gått ut.');
define('_ACTIONLOG_ACTIVATIONLINK', 'Aktiveringslänken har skickats.');
define('_MSG_ACTIVATION_SENT',		'En aktiveringslänk har skickats via mejl.');

// activation link emails
define('_ACTIVATE_REGISTER_MAIL',	"Hej <%memberName%>,\n\nDu behöver aktivera ditt konto hos <%siteName%> (<%siteUrl%>).\nDu kan göra det genom att besöka nedanstående länk: \n\n\t<%activationUrl%>\n\nDetta måste ske inom 2 dagar, därefter blir aktiveringslänken ogiltig.");
define('_ACTIVATE_REGISTER_MAILTITLE',	"Aktivera ditt '<%memberName%>' konto");
define('_ACTIVATE_REGISTER_TITLE',	'Välkommen <%memberName%>');
define('_ACTIVATE_REGISTER_TEXT',	'Du är nästan klar. Vänligen välj ett lösenord för ditt konto nedan.');
define('_ACTIVATE_FORGOT_MAIL',		"Hej <%memberName%>,\n\nGenom att använda nedanstående länk, kan du välja ett nytt lösenord hos <%siteName%> (<%siteUrl%>).\n\n\t<%activationUrl%>\n\nAktiveringslänken är giltig i 2 dagar.");
define('_ACTIVATE_FORGOT_MAILTITLE',"Återaktivera ditt '<%memberName%>' konto");
define('_ACTIVATE_FORGOT_TITLE',	'Välkommen <%memberName%>');
define('_ACTIVATE_FORGOT_TEXT',		'Du kan välja ett nytt lösenord nedan:');
define('_ACTIVATE_CHANGE_MAIL',		"Hej <%memberName%>,\n\nEftersom du har ändrat mejladress, måste du återaktivera kontot hos <%siteName%> (<%siteUrl%>).\nGör det genom att klicka på nedanstående länk: \n\n\t<%activationUrl%>\n\nAktiveringslänken är giltig i 2 dagar.");
define('_ACTIVATE_CHANGE_MAILTITLE',"Återaktivera ditt '<%memberName%>' konto");
define('_ACTIVATE_CHANGE_TITLE',	'Welcome <%memberName%>');
define('_ACTIVATE_CHANGE_TEXT',		'Din nya adress har verifierats. Tack!');
define('_ACTIVATE_SUCCESS_TITLE',	'Aktiveringen lyckades');
define('_ACTIVATE_SUCCESS_TEXT',	'Ditt konto har aktiverats.');
define('_MEMBERS_SETPWD',			'Ändra lösenord');
define('_MEMBERS_SETPWD_BTN',		'Ändra lösenord');
define('_QMENU_ACTIVATE',			'Aktivering av konto');
define('_QMENU_ACTIVATE_TEXT',		'<p>Efter du har aktiverat ditt konto, kan du börja använda det genom att <a href="index.php?action=showlogin">logga in</a>.</p>');

define('_PLUGS_BTN_UPDATE',			'Uppdatera prenumerationslistan');

// global settings
define('_SETTINGS_JSTOOLBAR',		'Stil');
define('_SETTINGS_JSTOOLBAR_FULL',	'Full verktygslåda (IE)');
define('_SETTINGS_JSTOOLBAR_SIMPLE','Enkel vertygslåda (Annan)');
define('_SETTINGS_JSTOOLBAR_NONE',	'Inaktivera verktygslåda');
define('_SETTINGS_URLMODE_HELP',	'(Information: <a href="documentation/tips.html#searchengines-fancyurls">Hur aktiverar man Fancy URLs?</a>)');

// extra plugin settings part when editing categories/members/blogs/...
define('_PLUGINS_EXTRA',			'Extra inställningar för plug-ins');

// itemlist info column keys
define('_LIST_ITEM_BLOG',			'blogg:');
define('_LIST_ITEM_CAT',			'kategori:');
define('_LIST_ITEM_AUTHOR',			'författare:');
define('_LIST_ITEM_DATE',			'datum:');
define('_LIST_ITEM_TIME',			'tid:');

// indication of registered members in comments list
define('_LIST_COMMENTS_MEMBER', 	'(medlem)');

// batch operations
define('_BATCH_WITH_SEL',			'Med vald:');
define('_BATCH_EXEC',				'Kör');

// quickmenu
define('_QMENU_HOME',				'Hem');
define('_QMENU_ADD',				'Lägg till inlägg');
define('_QMENU_ADD_SELECT',			'-- Välj --');
define('_QMENU_USER_SETTINGS',		'Inställningar');
define('_QMENU_USER_ITEMS',			'Inlägg');
define('_QMENU_USER_COMMENTS',		'Kommentarer');
define('_QMENU_MANAGE',				'Handhavande');
define('_QMENU_MANAGE_LOG',			'Loggbok');
define('_QMENU_MANAGE_SETTINGS',	'Övergripande inställningar');
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
define('_QMENU_INTRO_TEXT',			'<p>Det här är login-skärmen för Nucleus CMS, inläggsystemet som används på denna webbplats.</p><p>Om du har ett konto kan du logga in och börja skriva inlägg.</p>');

// helppages for plugins
define('_ERROR_PLUGNOHELPFILE',		'Hjälpfilen för denna plug-in kan inte hittas');
define('_PLUGS_HELP_TITLE',			'Hjälpsida för plug-in');
define('_LIST_PLUGS_HELP', 			'hjälp');


// END changed/started after 3.1

// START changed/added after v2.5beta START

// general settings (security)
define('_SETTINGS_EXTAUTH',			'Aktivera extern autentisering');
define('_WARNING_EXTAUTH',			'Varning! Aktivera endast vid behov.');

// member profile
define('_MEMBERS_BYPASS',			'Använd extern autentisering');

// 'always include in search' blog setting (yes/no) [in v2.5beta, the 'always' part wasn't clear]
define('_EBLOG_SEARCH',				'<em>Alltid</em> inkluderad i sökningar');

// END changed/added after v2.5beta

// START introduced after v2.0 START

// media library
define('_MEDIA_VIEW',				'visa');
define('_MEDIA_VIEW_TT',			'Visa fil (öppnas i ett nytt fönster)');
define('_MEDIA_FILTER_APPLY',		'Applicera filter');
define('_MEDIA_FILTER_LABEL',		'Filter: ');
define('_MEDIA_UPLOAD_TO',			'Ladda upp till...');
define('_MEDIA_UPLOAD_NEW',			'Ladda upp ny fil...');
define('_MEDIA_COLLECTION_SELECT',	'Välj');
define('_MEDIA_COLLECTION_TT',		'Växla till denna kategorin');
define('_MEDIA_COLLECTION_LABEL',	'Aktuell samling: ');

// tooltips on toolbar
define('_ADD_ALIGNLEFT_TT',			'Vänsterjusterad');
define('_ADD_ALIGNRIGHT_TT',		'Högerjusterad');
define('_ADD_ALIGNCENTER_TT',		'Centrera');


// generic upload failure
define('_ERROR_UPLOADFAILED',		'Uppladdningen misslyckades');

// END introduced after v2.0 END

// START introduced after v1.5 START

// posting to the past/edit timestamps
define('_EBLOG_ALLOWPASTPOSTING',	'Tillåt retroaktiva inlägg');
define('_ADD_CHANGEDATE',			'Uppdatera tidsmarkering');
define('_BMLET_CHANGEDATE',			'Uppdatera tidsmarkering');

// skin import/export
define('_OVERVIEW_SKINIMPORT',		'Importera/Exportera Skin...');

// skin settings
define('_PARSER_INCMODE_NORMAL',	'Normal');
define('_PARSER_INCMODE_SKINDIR',	'Använd mapp för Skins');
define('_SKIN_INCLUDE_MODE',		'Inkluderingsläge');
define('_SKIN_INCLUDE_PREFIX',		'Inkluderingsförstavelse');

// global settings
define('_SETTINGS_BASESKIN',		'Grundläggande Skin');
define('_SETTINGS_SKINSURL',		'URL för Skins');
define('_SETTINGS_ACTIONSURL',		'Hela URL:en till filen action.php');

// category moves (batch)
define('_ERROR_MOVEDEFCATEGORY',	'Kan inte flytta standardkategorin');
define('_ERROR_MOVETOSELF',			'Kan inte flytta kategorin (destinations-bloggen är samma som källan)');
define('_MOVECAT_TITLE',			'Välj blogg att flytta kategorin till');
define('_MOVECAT_BTN',				'Flytta');

// URLMode setting
define('_SETTINGS_URLMODE',			'URL-läge');
define('_SETTINGS_URLMODE_NORMAL',	'Normal');
define('_SETTINGS_URLMODE_PATHINFO','Fancy');

// Batch operations
define('_BATCH_NOSELECTION',		'Inget valt att applicera förändringar på');
define('_BATCH_ITEMS',				'Samkör förändringar på artiklar');
define('_BATCH_CATEGORIES',			'Samkör förändringar på kategorier');
define('_BATCH_MEMBERS',			'Samkör förändringar på medlemmar');
define('_BATCH_TEAM',				'Samkör förändringar på Team-medlemmar');
define('_BATCH_COMMENTS',			'Samkör förändringar på kommentarer');
define('_BATCH_UNKNOWN',			'Ogiltig förändring: ');
define('_BATCH_EXECUTING',			'Verkställer');
define('_BATCH_ONCATEGORY',			'på kategori');
define('_BATCH_ONITEM',				'på inlägg');
define('_BATCH_ONCOMMENT',			'på kommentar');
define('_BATCH_ONMEMBER',			'på medlem');
define('_BATCH_ONTEAM',				'på team-medlem');
define('_BATCH_SUCCESS',			'Det lyckades!');
define('_BATCH_DONE',				'Utfört!');
define('_BATCH_DELETE_CONFIRM',		'Bekräfta borttagning');
define('_BATCH_DELETE_CONFIRM_BTN',	'Bekräfta borttagning');
define('_BATCH_SELECTALL',			'välj alla');
define('_BATCH_DESELECTALL',		'avmarkera alla');

// batch operations: options in dropdowns
define('_BATCH_ITEM_DELETE',		'Ta bort');
define('_BATCH_ITEM_MOVE',			'Flytta');
define('_BATCH_MEMBER_DELETE',		'Ta bort');
define('_BATCH_MEMBER_SET_ADM',		'Ge admin-rättigheter');
define('_BATCH_MEMBER_UNSET_ADM',	'Ta ifrån admin-rättigheter');
define('_BATCH_TEAM_DELETE',		'Ta bort från team');
define('_BATCH_TEAM_SET_ADM',		'Ge admin-rättigheter');
define('_BATCH_TEAM_UNSET_ADM',		'Ta ifrån admin-rättigheter');
define('_BATCH_CAT_DELETE',			'Ta bort');
define('_BATCH_CAT_MOVE',			'Flytta till annan blogg');
define('_BATCH_COMMENT_DELETE',		'Ta bort');

// itemlist: Add new item...
define('_ITEMLIST_ADDNEW',			'Lägg till ny inlägg...');
define('_ADD_PLUGIN_EXTRAS',		'Extra inställningar för plug-in');

// errors
define('_ERROR_CATCREATEFAIL',		'Kunde inte skapa en ny kategori');
define('_ERROR_NUCLEUSVERSIONREQ',	'Denna plug-in kräver en nyare version av Nucleus: ');

// backlinks
define('_BACK_TO_BLOGSETTINGS',		'Tillbaka till inställningarna för bloggen');

// skin import export
define('_SKINIE_TITLE_IMPORT',		'Importera');
define('_SKINIE_TITLE_EXPORT',		'Exportera');
define('_SKINIE_BTN_IMPORT',		'Importera');
define('_SKINIE_BTN_EXPORT',		'Exportera valda skins/mallar');
define('_SKINIE_LOCAL',				'Importer från en lokal fil:');
define('_SKINIE_NOCANDIDATES',		'Inga tillgängliga skins kunde importeras');
define('_SKINIE_FROMURL',			'Importera från URL:');
define('_SKINIE_EXPORT_INTRO',		'Välj vilka skins och mallar du vill exportera');
define('_SKINIE_EXPORT_SKINS',		'Skins');
define('_SKINIE_EXPORT_TEMPLATES',	'Mallar');
define('_SKINIE_EXPORT_EXTRA',		'Extra information');
define('_SKINIE_CONFIRM_OVERWRITE',	'Skriv över skins som redan existerar');
define('_SKINIE_CONFIRM_IMPORT',	'Ja, jag vill importera denna');
define('_SKINIE_CONFIRM_TITLE',		'Om importering');
define('_SKINIE_INFO_SKINS',		'Skins i filen');
define('_SKINIE_INFO_TEMPLATES',	'Mallar i filen');
define('_SKINIE_INFO_GENERAL',		'Information:');
define('_SKINIE_INFO_SKINCLASH',	'Skin-namn:');
define('_SKINIE_INFO_TEMPLCLASH',	'Mall-namn:');
define('_SKINIE_INFO_IMPORTEDSKINS','Importerade skins:');
define('_SKINIE_INFO_IMPORTEDTEMPLS','Importerade mallar:');
define('_SKINIE_DONE',				'Importeringen är klar');

define('_AND',						'och');
define('_OR',						'eller');

// empty fields on template edit
define('_EDITTEMPLATE_EMPTY',		'tomt fält (klicka för att redigera)');

// skin overview list
define('_LIST_SKINS_INCMODE',		'Inkluderingsläge:');
define('_LIST_SKINS_INCPREFIX',		'Inkluderingsförstavelse:');
define('_LIST_SKINS_DEFINED',		'Definerade delar:');

// backup
define('_BACKUPS_TITLE',			'Backup / Återställ');
define('_BACKUP_TITLE',				'Backup');
define('_BACKUP_INTRO',				'Klicka på knappen nedan för att skapa en backup av din Nucleus-databas. Du kommer att bli uppmanad att spara en fil. Välj en säker plats.');
define('_BACKUP_ZIP_YES',			'Försök att använda komprimering');
define('_BACKUP_ZIP_NO',			'Använd inte komprimering');
define('_BACKUP_BTN',				'Skapa backup');
define('_BACKUP_NOTE',				'<b>Notera:</b> Enbart innehållet i databasen blir sparat genom en backup. Mediafiler och inställningar i config.php blir däremot <b>INTE</b> inkluderade');
define('_RESTORE_TITLE',			'Restore');
define('_RESTORE_NOTE',				'<b>VARNING:</b> Återställning från en backup kommer att <b>RADERA</b> all aktuell data i databasen! Gör endast detta om du är helt säker!	<br />	<b>Notera:</b> Säkerställ att versionen av Nucleus som du skapade din backup i är samma som den du använder nu! Annars kommer det inte att fungera');
define('_RESTORE_INTRO',			'Välj backup-filen nedan (den kommer att laddas upp till servern) och klicka på "Återställ" för att starta');
define('_RESTORE_IMSURE',			'Ja, jag vill utföra detta!');
define('_RESTORE_BTN',				'Återställ från fil');
define('_RESTORE_WARNING',			'(säkerställ att du väljer rätt backup, gör eventuellt en ytterligare backup innan)');
define('_ERROR_BACKUP_NOTSURE',		'Du behöver kryssa i boxen');
define('_RESTORE_COMPLETE',			'Återställning färdig');

// new item notification
define('_NOTIFY_NI_MSG',			'En ny inlägg har blivit inlagd:');
define('_NOTIFY_NI_TITLE',			'Ny inlägg!');
define('_NOTIFY_KV_MSG',			'Karma-rösta på inlägg:');
define('_NOTIFY_KV_TITLE',			'Nucleus-karma:');
define('_NOTIFY_NC_MSG',			'Kommentera inlägg:');
define('_NOTIFY_NC_TITLE',			'Nucleus-kommentar:');
define('_NOTIFY_USERID',			'Användar-ID:');
define('_NOTIFY_USER',				'Användare:');
define('_NOTIFY_COMMENT',			'Kommentar:');
define('_NOTIFY_VOTE',				'Rösta:');
define('_NOTIFY_HOST',				'Server:');
define('_NOTIFY_IP',				'IP-adress:');
define('_NOTIFY_MEMBER',			'Medlem:');
define('_NOTIFY_TITLE',				'Titel:');
define('_NOTIFY_CONTENTS',			'Innehåll:');

// member mail message
define('_MMAIL_MSG',				'Ett meddelande skickat till dig');
define('_MMAIL_FROMANON',			'en anonym besökare');
define('_MMAIL_FROMNUC',			'Inlagd från en blogg på');
define('_MMAIL_TITLE',				'Ett meddelande från');
define('_MMAIL_MAIL',				'Meddelande:');

// END introduced after v1.5 END


// START introduced after v1.1 START

// bookmarklet buttons
define('_BMLET_ADD',				'Lägg till inlägg');
define('_BMLET_EDIT',				'Redigera inlägg');
define('_BMLET_DELETE',				'Ta bort inlägg');
define('_BMLET_BODY',				'Body');
define('_BMLET_MORE',				'Utökad');
define('_BMLET_OPTIONS',			'Alternativ');
define('_BMLET_PREVIEW',			'Förhandsgranska');

// used in bookmarklet
define('_ITEM_UPDATED',				'Inläggn uppdaterades');
define('_ITEM_DELETED',				'Inläggn raderades');

// plugins
define('_CONFIRMTXT_PLUGIN',		'Är du säker att du vill radera denna plug-in med namnet');
define('_ERROR_NOSUCHPLUGIN',		'Det finns ingen sådan plug-in');
define('_ERROR_DUPPLUGIN',			'Denna plug-in är redan installerad');
define('_ERROR_PLUGFILEERROR',		'Ingen sådan plug-in existerar, eller också behöver restriktionerna förändras "CHMOD"');
define('_PLUGS_NOCANDIDATES',		'Inga lämpliga plug-ins hittades');

define('_PLUGS_TITLE_MANAGE',		'Hantera plug-ins');
define('_PLUGS_TITLE_INSTALLED',	'Installerade just nu');
define('_PLUGS_TITLE_UPDATE',		'Uppdatera prenumerationslista');
define('_PLUGS_TEXT_UPDATE',		'Nucleus cachar plug-ins. När du uppdaterar en plug-in genom att byta ut filen, måste du köra denna uppdatering för att rätt prenumerationer ska cachas');
define('_PLUGS_TITLE_NEW',			'Installera ny plug-in');
define('_PLUGS_ADD_TEXT',			'Nedan finns en lista på alla filer i din mapp, vilken kan innehålla icke installerade plug-ins. Säkerställ att det <strong>verkligen</strong> är en plug-in innan du installerar den');
define('_PLUGS_BTN_INSTALL',		'Installera plug-in');
define('_BACKTOOVERVIEW',			'Tillbaka till överblick');

// editlink
define('_TEMPLATE_EDITLINK',		'Redigera inläggns länk');

// add left / add right tooltips
define('_ADD_LEFT_TT',				'Lägg till en vänsterbox');
define('_ADD_RIGHT_TT',				'Lägg till en högerbox');

// add/edit item: new category (in dropdown box)
define('_ADD_NEWCAT',				'Ny kategori...');

// new settings
define('_SETTINGS_PLUGINURL',		'Plug-in URL');
define('_SETTINGS_MAXUPLOADSIZE',	'Maximal filstorlek på uploads (bytes)');
define('_SETTINGS_NONMEMBERMSGS',	'Tillåt icke-medlemmar att skicka meddelanden');
define('_SETTINGS_PROTECTMEMNAMES',	'Skydda medlemsnamn');

// overview screen
define('_OVERVIEW_PLUGINS',			'Hantera plug-ins...');

// actionlog
define('_ACTIONLOG_NEWMEMBER',		'Ny medlemsregistrering:');

// membermail (when not logged in)
define('_MEMBERMAIL_MAIL',			'Din mejladress:');

// file upload
define('_ERROR_DISALLOWEDUPLOAD2',	'Du har inte admin-rättigheter. Därför är du inte tillåten att ladda upp filer till denna mapp');

// plugin list
define('_LISTS_INFO',				'Information');
define('_LIST_PLUGS_AUTHOR',		'Av:');
define('_LIST_PLUGS_VER',			'Version:');
define('_LIST_PLUGS_SITE',			'Besök sida');
define('_LIST_PLUGS_DESC',			'Beskrivning:');
define('_LIST_PLUGS_SUBS',			'Läggs till på följande händelser:');
define('_LIST_PLUGS_UP',			'flytta upp');
define('_LIST_PLUGS_DOWN',			'flytta ned');
define('_LIST_PLUGS_UNINSTALL',		'avinstallera');
define('_LIST_PLUGS_ADMIN',			'admin');
define('_LIST_PLUGS_OPTIONS',		'redigera&nbsp;alternativ');

// plugin option list
define('_LISTS_VALUE',				'Värde');

// plugin options
define('_ERROR_NOPLUGOPTIONS',		'denna plug-in har inga valda alternativ');
define('_PLUGS_BACK',				'Tillbaka till överblicken av plug-ins');
define('_PLUGS_SAVE',				'Spara alternativ');
define('_PLUGS_OPTIONS_UPDATED',	'Alternativen för plug-ins uppdaterades');

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
define('_ERRORMSG',					'Ett fel har inträffat!');
define('_BACK',						'Gå tillbaka');
define('_NOTLOGGEDIN',				'Inte inloggad');
define('_LOGGEDINAS',				'Inloggad som');
define('_ADMINHOME',				'Admin Hem');
define('_NAME',						'Namn');
define('_BACKHOME',					'Tillbaka till Admin Hem');
define('_BADACTION',				'Ingen existerande händelse åberopad');
define('_MESSAGE',					'Meddelande');
define('_HELP_TT',					'Hjälp!');
define('_YOURSITE',					'Din webbsida');


define('_POPUP_CLOSE',				'Stäng fönster');

define('_LOGIN_PLEASE',				'Vänligen logga in först');

// commentform
define('_COMMENTFORM_YOUARE',		'Du är');
define('_COMMENTFORM_SUBMIT',		'Kommentera');
define('_COMMENTFORM_COMMENT',		'Din kommentar');
define('_COMMENTFORM_NAME',			'Namn');
define('_COMMENTFORM_MAIL',			'Mejl/Webb');
define('_COMMENTFORM_REMEMBER',		'Kom ihåg mig');

// loginform
define('_LOGINFORM_NAME',			'Användarnamn');
define('_LOGINFORM_PWD',			'Lösenord');
define('_LOGINFORM_YOUARE',			'Inloggad som');
define('_LOGINFORM_SHARED',			'Delad dator');

// member mailform
define('_MEMBERMAIL_SUBMIT',		'Skicka meddelande');

// search form
define('_SEARCHFORM_SUBMIT',		'Sök');

// add item form
define('_ADD_ADDTO',				'Lägg till ny inlägg till');
define('_ADD_CREATENEW',			'Skapa ny inlägg');
define('_ADD_BODY',					'Body');
define('_ADD_TITLE',				'Titel');
define('_ADD_MORE',					'Utökad text (valfri)');
define('_ADD_CATEGORY',				'Kategori');
define('_ADD_PREVIEW',				'Förhandsgranska');
define('_ADD_DISABLE_COMMENTS',		'Inaktivera kommentarer?');
define('_ADD_DRAFTNFUTURE',			'Skissera &amp; framtida artiklar');
define('_ADD_ADDITEM',				'Lägg till inlägg');
define('_ADD_ADDNOW',				'Publicera nu');
define('_ADD_ADDLATER',				'Publicera senare');
define('_ADD_PLACE_ON',				'Publicera på');
define('_ADD_ADDDRAFT',				'Lägg till utkast');
define('_ADD_NOPASTDATES',			'(tidigare datum och tid är inte giltiga, den aktuella tiden kommer att användas)');
define('_ADD_BOLD_TT',				'Fet');
define('_ADD_ITALIC_TT',			'Kursiv');
define('_ADD_HREF_TT',				'Skapa länk');
define('_ADD_MEDIA_TT',				'Lägg till media');
define('_ADD_PREVIEW_TT',			'Visa/Dölj förhandsgranskning');
define('_ADD_CUT_TT',				'Klipp ut');
define('_ADD_COPY_TT',				'Kopiera');
define('_ADD_PASTE_TT',				'Klistra in');


// edit item form
define('_EDIT_ITEM',				'Redigera inlägg');
define('_EDIT_SUBMIT',				'Redigera inlägg');
define('_EDIT_ORIG_AUTHOR',			'Ursprunglig författare');
define('_EDIT_BACKTODRAFTS',		'Lägg till utkast');
define('_EDIT_COMMENTSNOTE',		'(notera: inaktivering av kommentarer kommer inte dölja tidigare kommentarer)');

// used on delete screens
define('_DELETE_CONFIRM',			'Vänligen bekräfta borttagning');
define('_DELETE_CONFIRM_BTN',		'Bekräfta borttagning');
define('_CONFIRMTXT_ITEM',			'Du är på väg att radera följande artiklar:');
define('_CONFIRMTXT_COMMENT',		'Du kommer att radera följande kommentarer:');
define('_CONFIRMTXT_TEAM1',			'Du kommer att radera ');
define('_CONFIRMTXT_TEAM2',			' från team-listan för bloggen ');
define('_CONFIRMTXT_BLOG',			'Bloggen du kommer att radera är: ');
define('_WARNINGTXT_BLOGDEL',		'Varning! Borttagning av en blogg kommer att radera alla artiklar och kommentarer. Vänligen bekräfta!<br />Avbryt inte borttagningsprocessen.');
define('_CONFIRMTXT_MEMBER',		'Du kommer att tabort följande medlemsprofil: ');
define('_CONFIRMTXT_TEMPLATE',		'Du kommer att ta bort mallen med namnet ');
define('_CONFIRMTXT_SKIN',			'Du kommer att ta bort skin med namnet ');
define('_CONFIRMTXT_BAN',			'Du kommer att ta bort bannen för ip-serien ');
define('_CONFIRMTXT_CATEGORY',		'Du kommer att ta bort kategorin ');

// some status messages
define('_DELETED_ITEM',				'Inlägg raderad');
define('_DELETED_MEMBER',			'Medlem raderad');
define('_DELETED_COMMENT',			'Kommentar raderad');
define('_DELETED_BLOG',				'Blogg raderad');
define('_DELETED_CATEGORY',			'Kategori raderad');
define('_ITEM_MOVED',				'Inlägg flyttad');
define('_ITEM_ADDED',				'Inlägg publicerad');
define('_COMMENT_UPDATED',			'Kommentar uppdaterad');
define('_SKIN_UPDATED',				'Skin-egenskaper har sparats');
define('_TEMPLATE_UPDATED',			'Mallegenskaper har sparats');

// errors
define('_ERROR_COMMENT_LONGWORD',	'Använd inte ord längre än 90 tecken');
define('_ERROR_COMMENT_NOCOMMENT',	'Vänligen skriv en kommentar');
define('_ERROR_COMMENT_NOUSERNAME',	'Ogiltigt användarnamn');
define('_ERROR_COMMENT_TOOLONG',	'Dina kommentarer är för långa (max. 5000 tecken)');
define('_ERROR_COMMENTS_DISABLED',	'Kommentarer är för tillfället inaktiverade.');
define('_ERROR_COMMENTS_NONPUBLIC',	'Du måste vara inloggad som medlem för att kommentera');
define('_ERROR_COMMENTS_MEMBERNICK','Namnet är upptaget av en medlem. Välj något annat.');
define('_ERROR_SKIN',				'Skin-fel');
define('_ERROR_ITEMCLOSED',			'Denna inlägg är stängd. Du kan inte kommentera/rösta.');
define('_ERROR_NOSUCHITEM',			'Inget sådant inlägg existerar');
define('_ERROR_NOSUCHBLOG',			'Det finns ingen sådan blogg');
define('_ERROR_NOSUCHSKIN',			'Det finns inget sådant skin');
define('_ERROR_NOSUCHMEMBER',		'Det finns ingen sådan medlem');
define('_ERROR_NOTONTEAM',			'Du tillhör inte team-listan.');
define('_ERROR_BADDESTBLOG',		'Destinationsbloggen existerar inte');
define('_ERROR_NOTONDESTTEAM',		'Kan inte flytta, eftersom du inte tillhör team-listan');
define('_ERROR_NOEMPTYITEMS',		'Kan inte lägga till tomma element!');
define('_ERROR_BADMAILADDRESS',		'Mejladressen är ogiltig');
define('_ERROR_BADNOTIFY',			'En eller flera av mottagaradresserna är ogiltiga');
define('_ERROR_BADNAME',			'Namnet är ogiltigt (a-z och 0-9 tillåtna, inga mellanslag)');
define('_ERROR_NICKNAMEINUSE',		'Namnet är upptaget av en annan medlem');
define('_ERROR_PASSWORDMISMATCH',	'Lösenorden måste stämma överens');
define('_ERROR_PASSWORDTOOSHORT',	'Lösenordet måste innehålla minst 6 tecken');
define('_ERROR_PASSWORDMISSING',	'Lösenordet kan inte vara blankt');
define('_ERROR_REALNAMEMISSING',	'Du måste skriva ett riktigt namn');
define('_ERROR_ATLEASTONEADMIN',	'Det måste finnas åtminstone en super-admin som kan logga in till admin-arean.');
define('_ERROR_ATLEASTONEBLOGADMIN','Att utföra denna åtgärd skulle göra din blogg ohanterbar. Det måste finnas minst en admin.');
define('_ERROR_ALREADYONTEAM',		'Du kan inte lägga till en medlem som redan finns i teamet');
define('_ERROR_BADSHORTBLOGNAME',	'Bloggens korta namn kan bara innehålla a-z och 0-9, inga mellanslag');
define('_ERROR_DUPSHORTBLOGNAME',	'En annan blogg använder redan det korta bloggnamnet. Dessa namn måste vara unika.');
define('_ERROR_UPDATEFILE',			'Kan inte skriva till filen. Prova att ändra CHMOD (666)');
define('_ERROR_DELDEFBLOG',			'Kan inte ta bort standardbloggen');
define('_ERROR_DELETEMEMBER',		'Kan inte ta bort denna medlem, förmodligen därför att han/hon är författare');
define('_ERROR_BADTEMPLATENAME',	'Ogiltigt namn för mall, använd endast a-z och 0-9, inga mellanslag');
define('_ERROR_DUPTEMPLATENAME',	'Det finns redan en mall med detta namn');
define('_ERROR_BADSKINNAME',		'Ogiltigt namn för detta skin (endast a-z, 0-9 är tillåtna, inga mellanslag)');
define('_ERROR_DUPSKINNAME',		'Det finns redan ett skin med detta namn');
define('_ERROR_DEFAULTSKIN',		'Det måste alltid finnas ett skin med namnet "default"');
define('_ERROR_SKINDEFDELETE',		'Kan inte radera skin, eftersom det är standard för följande bloggar: ');
define('_ERROR_DISALLOWED',			'Du är inte behörig att utföra denna åtgärd');
define('_ERROR_DELETEBAN',			'Kan inte radera bannen (den existerar inte)');
define('_ERROR_ADDBAN',				'Kan inte banna.');
define('_ERROR_BADACTION',			'Vald åtgärd existerar inte');
define('_ERROR_MEMBERMAILDISABLED',	'Meddelanden mellan medlemmar är inaktiverade');
define('_ERROR_MEMBERCREATEDISABLED','Skapande av medlemmar är inaktiverat');
define('_ERROR_INCORRECTEMAIL',		'Felaktig mejladress');
define('_ERROR_VOTEDBEFORE',		'Du har redan röstat');
define('_ERROR_BANNED1',			'Kan inte utföra detta eftersom du (IP ');
define('_ERROR_BANNED2',			') är spärrad. Meddelande: \'');
define('_ERROR_BANNED3',			'\'');
define('_ERROR_LOGINNEEDED',		'Du måste vara inloggad för att utföra denna åtgärd');
define('_ERROR_CONNECT',			'Fel vid anslutning');
define('_ERROR_FILE_TOO_BIG',		'Filen är för stor!');
define('_ERROR_BADFILETYPE',		'Tyvärr, detta filformat är inte tillåtet');
define('_ERROR_BADREQUEST',			'Felaktigt uppladdningsförfarande');
define('_ERROR_DISALLOWEDUPLOAD',	'Du finns inte med i något blogg-team. Därför kan du inte ladda upp filer');
define('_ERROR_BADPERMISSIONS',		'Fil- eller mapprättigheterna är inte korrekt anpassade');
define('_ERROR_UPLOADMOVEP',		'Fel vid uppladdning av fil');
define('_ERROR_UPLOADCOPY',			'Fel vid kopiering');
define('_ERROR_UPLOADDUPLICATE',	'Det finns redan en fil med det namnet. Prova att byta namn innan uppladdning.');
define('_ERROR_LOGINDISALLOWED',	'Tyvärr, du är inte tillåten att logga in som admin.');
define('_ERROR_DBCONNECT',			'Kunde inte ansluta till MySQL-servern');
define('_ERROR_DBSELECT',			'Kunde inte välja Nucleus databas.');
define('_ERROR_NOSUCHLANGUAGE',		'Det existerar inte sådan språkfil');
define('_ERROR_NOSUCHCATEGORY',		'Det finns ingen sådan kategori');
define('_ERROR_DELETELASTCATEGORY',	'Det måste finnas åtminstone en kategori');
define('_ERROR_DELETEDEFCATEGORY',	'Kan inte radera standardkategorin');
define('_ERROR_BADCATEGORYNAME',	'Felaktigt kategorinamn');
define('_ERROR_DUPCATEGORYNAME',	'Det finns redan en kategori med detta namn');

// some warnings (used for mediadir setting)
define('_WARNING_NOTADIR',			'Varning: Aktuellt värde är inte en mapp!');
define('_WARNING_NOTREADABLE',		'Varning: Aktuellt värde är en skrivskyddad mapp!');
define('_WARNING_NOTWRITABLE',		'Varning: Aktuellt värde INTE en skrivbar mapp!');

// media and upload
define('_MEDIA_UPLOADLINK',			'Ladda upp en ny fil');
define('_MEDIA_MODIFIED',			'förändrad');
define('_MEDIA_FILENAME',			'filnamn');
define('_MEDIA_DIMENSIONS',			'storlek');
define('_MEDIA_INLINE',				'Inline');
define('_MEDIA_POPUP',				'Pop-up');
define('_UPLOAD_TITLE',				'Välj fil');
define('_UPLOAD_MSG',				'Välj fil att ladda upp och klicka på knappen.');
define('_UPLOAD_BUTTON',			'Ladda upp');

// some status messages
//define('_MSG_ACCOUNTCREATED',		'Kontot skapades, lösenordet kommer att skickas via mejl');
//define('_MSG_PASSWORDSENT',			'Lösenordet har skickats via mejl.');
define('_MSG_LOGINAGAIN',			'Du måste logga in igen');
define('_MSG_SETTINGSCHANGED',		'Inställningarna ändrades');
define('_MSG_ADMINCHANGED',			'Admin ändrades');
define('_MSG_NEWBLOG',				'Ny blogg skapades');
define('_MSG_ACTIONLOGCLEARED',		'Händelse-loggen rensad');

// actionlog in admin area
define('_ACTIONLOG_DISALLOWED',		'Förbjuden åtgärd: ');
define('_ACTIONLOG_PWDREMINDERSENT','Nytt lösenord skickat till ');
define('_ACTIONLOG_TITLE',			'Händelse-logg');
define('_ACTIONLOG_CLEAR_TITLE',	'Rensa händelse-logg');
define('_ACTIONLOG_CLEAR_TEXT',		'Rensa loggboken nu');

// team management
define('_TEAM_TITLE',				'Hantera bloggens team ');
define('_TEAM_CURRENT',				'Aktuellt team');
define('_TEAM_ADDNEW',				'Lägg till en ny medlem i ett team');
define('_TEAM_CHOOSEMEMBER',		'Välj medlem');
define('_TEAM_ADMIN',				'Admin-rättigheter? ');
define('_TEAM_ADD',					'Lägg till i team');
define('_TEAM_ADD_BTN',				'Lägg till');

// blogsettings
define('_EBLOG_TITLE',				'Redigera bloggens inställningar');
define('_EBLOG_TEAM_TITLE',			'Redigera team');
define('_EBLOG_TEAM_TEXT',			'Klicka här för att redigera team...');
define('_EBLOG_SETTINGS_TITLE',		'Inställningar för blogg');
define('_EBLOG_NAME',				'Bloggens namn');
define('_EBLOG_SHORTNAME',			'Kort blogg-namn');
define('_EBLOG_SHORTNAME_EXTRA',	'<br />(kan bara innehålla a-z, inga mellanslag)');
define('_EBLOG_DESC',				'Beskrivning för blogg');
define('_EBLOG_URL',				'URL');
define('_EBLOG_DEFSKIN',			'Standard-Skin');
define('_EBLOG_DEFCAT',				'Standardkategori');
define('_EBLOG_LINEBREAKS',			'Konvertera radbrytningar');
define('_EBLOG_DISABLECOMMENTS',	'Aktivera möjligheten att kommentera?');
define('_EBLOG_ANONYMOUS',			'Tillåt kommentarer av icke-medlemmar?');
define('_EBLOG_NOTIFY',				'Underrättelse-address(er) (använd ; som avskiljare)');
define('_EBLOG_NOTIFY_ON',			'Underrätta vid');
define('_EBLOG_NOTIFY_COMMENT',		'Ny kommentar');
define('_EBLOG_NOTIFY_KARMA',		'Ny karma-röst');
define('_EBLOG_NOTIFY_ITEM',		'Nytt blogg-inlägg');
define('_EBLOG_PING',				'Pinga Weblogs.com vid uppdatering?');
define('_EBLOG_MAXCOMMENTS',		'Största andelen kommentarer');
define('_EBLOG_UPDATE',				'Uppdatera fil');
define('_EBLOG_OFFSET',				'Tid offset');
define('_EBLOG_STIME',				'Aktuell tid på servern är');
define('_EBLOG_BTIME',				'Aktuell tid i bloggen är');
define('_EBLOG_CHANGE',				'Ändra inställningar');
define('_EBLOG_CHANGE_BTN',			'Ändra inställningar');
define('_EBLOG_ADMIN',				'Blogg Admin');
define('_EBLOG_ADMIN_MSG',			'Du kommer att tillägnas admin-rättigheter');
define('_EBLOG_CREATE_TITLE',		'Skapa ny blogg');
define('_EBLOG_CREATE_TEXT',		'Fyll i formuläret för att skapa en ny blogg. <br /><br /> <b>Notera:</b> Endast de nödvändiga alternativen finns med. Om du vill ändra avancerade inställningar, gå in i bloggens sida efter skapandet.');
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
define('_TEMPLATE_AVAILABLE_TITLE',	'Tillgängliga mallar');
define('_TEMPLATE_NEW_TITLE',		'Ny mall');
define('_TEMPLATE_NAME',			'Mallens namn');
define('_TEMPLATE_DESC',			'Mallens beskrivning');
define('_TEMPLATE_CREATE',			'Skapa mall');
define('_TEMPLATE_CREATE_BTN',		'Skapa mall');
define('_TEMPLATE_EDIT_TITLE',		'Redigera mall');
define('_TEMPLATE_BACK',			'Tillbaka till översikten av mallar');
define('_TEMPLATE_EDIT_MSG',		'Alla malldelar behövs inte, lämna icke nödvändiga fält tomma.');
define('_TEMPLATE_SETTINGS',		'Mallinställningar');
define('_TEMPLATE_ITEMS',			'Inlägg');
define('_TEMPLATE_ITEMHEADER',		'Inläggns header');
define('_TEMPLATE_ITEMBODY',		'Body');
define('_TEMPLATE_ITEMFOOTER',		'Inläggns footer');
define('_TEMPLATE_MORELINK',		'Länk till utökat inlägg');
define('_TEMPLATE_NEW',				'Indikering av nya inlägg');
define('_TEMPLATE_COMMENTS_ANY',	'Kommentarer (eventuellt)');
define('_TEMPLATE_CHEADER',			'Kommentarers header');
define('_TEMPLATE_CBODY',			'Kommentarers body');
define('_TEMPLATE_CFOOTER',			'Kommentarers footer');
define('_TEMPLATE_CONE',			'En kommentar');
define('_TEMPLATE_CMANY',			'Tvä eller flera kommentarer');
define('_TEMPLATE_CMORE',			'Kommentarernas läs mer');
define('_TEMPLATE_CMEXTRA',			'Extra för medlem');
define('_TEMPLATE_COMMENTS_NONE',	'Kommentarer (om det saknas)');
define('_TEMPLATE_CNONE',			'Inga kommentarer');
define('_TEMPLATE_COMMENTS_TOOMUCH','Kommentarer (om det finns, men för många för att visa)');
define('_TEMPLATE_CTOOMUCH',		'För många kommentarer');
define('_TEMPLATE_ARCHIVELIST',		'Arkivlista');
define('_TEMPLATE_AHEADER',			'Arkivlistans header');
define('_TEMPLATE_AITEM',			'Arkivlistans inlägg');
define('_TEMPLATE_AFOOTER',			'Arkivlistans footer');
define('_TEMPLATE_DATETIME',		'Datum och tid');
define('_TEMPLATE_DHEADER',			'Datumets header');
define('_TEMPLATE_DFOOTER',			'Datumets footer');
define('_TEMPLATE_DFORMAT',			'Datumets format');
define('_TEMPLATE_TFORMAT',			'Tidsformat');
define('_TEMPLATE_LOCALE',			'Lokal');
define('_TEMPLATE_IMAGE',			'Bild-popup');
define('_TEMPLATE_PCODE',			'Källkod för popups');
define('_TEMPLATE_ICODE',			'Källkod för Inline-bilder');
define('_TEMPLATE_MCODE',			'Källkod för mediaobjekt');
define('_TEMPLATE_SEARCH',			'Sök');
define('_TEMPLATE_SHIGHLIGHT',		'Markering/Highlight');
define('_TEMPLATE_SNOTFOUND',		'Inga träffar hittades');
define('_TEMPLATE_UPDATE',			'Uppdatera');
define('_TEMPLATE_UPDATE_BTN',		'Uppdatera mall');
define('_TEMPLATE_RESET_BTN',		'Rensa data');
define('_TEMPLATE_CATEGORYLIST',	'Kategorilista');
define('_TEMPLATE_CATHEADER',		'Kategorilista header');
define('_TEMPLATE_CATITEM',			'Kategorilista inlägg');
define('_TEMPLATE_CATFOOTER',		'Kategorilista footer');

// skins
define('_SKIN_EDIT_TITLE',			'Redigera Skins');
define('_SKIN_AVAILABLE_TITLE',		'Tillgängliga Skins');
define('_SKIN_NEW_TITLE',			'Nytt Skin');
define('_SKIN_NAME',				'Namn');
define('_SKIN_DESC',				'Beskrivning');
define('_SKIN_TYPE',				'Typ av innehåll');
define('_SKIN_CREATE',				'Skapa');
define('_SKIN_CREATE_BTN',			'Skapa Skin');
define('_SKIN_EDITONE_TITLE',		'Redigera skin');
define('_SKIN_BACK',				'Tilbaka överblicken av Skins');
define('_SKIN_PARTS_TITLE',			'Skin-delar');
define('_SKIN_PARTS_MSG',			'Alla alternativ är inte nödvändiga.');
define('_SKIN_PART_MAIN',			'Main Index');
define('_SKIN_PART_ITEM',			'Inlägg');
define('_SKIN_PART_ALIST',			'Arkivlista');
define('_SKIN_PART_ARCHIVE',		'Arkiv');
define('_SKIN_PART_SEARCH',			'Sök');
define('_SKIN_PART_ERROR',			'Fel');
define('_SKIN_PART_MEMBER',			'Medlemsdetaljer');
define('_SKIN_PART_POPUP',			'Bild-popups');
define('_SKIN_GENSETTINGS_TITLE',	'Generella inställningar');
define('_SKIN_CHANGE',				'Ändra');
define('_SKIN_CHANGE_BTN',			'Ändra inställningarna');
define('_SKIN_UPDATE_BTN',			'Uppdatera Skin');
define('_SKIN_RESET_BTN',			'Rensa data');
define('_SKIN_EDITPART_TITLE',		'Redigera Skin');
define('_SKIN_GOBACK',				'Gå tillbaka');
define('_SKIN_ALLOWEDVARS',			'Tillåtna variabler (klicka för info):');

// global settings
define('_SETTINGS_TITLE',			'Generella inställningar');
define('_SETTINGS_SUB_GENERAL',		'Generella inställningar');
define('_SETTINGS_DEFBLOG',			'Standardblogg');
define('_SETTINGS_ADMINMAIL',		'Admins mejl');
define('_SETTINGS_SITENAME',		'Sidnamn');
define('_SETTINGS_SITEURL',			'Sidans URL (ska avslutas med snedstreck)');
define('_SETTINGS_ADMINURL',		'Admin-sidans URL (ska avslutas med snedstreck)');
define('_SETTINGS_DIRS',			'Nucleus mappar');
define('_SETTINGS_MEDIADIR',		'Mediamapp');
define('_SETTINGS_SEECONFIGPHP',	'(se config.php)');
define('_SETTINGS_MEDIAURL',		'Media URL (ska avslutas med snedstreck)');
define('_SETTINGS_ALLOWUPLOAD',		'Tillåt uppladdning av filer?');
define('_SETTINGS_ALLOWUPLOADTYPES','Tillåtna filtyper');
define('_SETTINGS_CHANGELOGIN',		'Tillåt medlemmar att ändra namn/lösenord');
define('_SETTINGS_COOKIES_TITLE',	'Cookie-inställningar');
define('_SETTINGS_COOKIELIFE',		'Livstid för inloggnings-cookies');
define('_SETTINGS_COOKIESESSION',	'Session-cookies');
define('_SETTINGS_COOKIEMONTH',		'En månad');
define('_SETTINGS_COOKIEPATH',		'Cookie-sökväg (avancerad)');
define('_SETTINGS_COOKIEDOMAIN',	'Cookie-domän (avancerad)');
define('_SETTINGS_COOKIESECURE',	'Säker cookie (avancerad)');
define('_SETTINGS_LASTVISIT',		'Spara cookies från senaste besök');
define('_SETTINGS_ALLOWCREATE',		'Tillåt besökare att skapa medlemskonton');
define('_SETTINGS_NEWLOGIN',		'Inloggning tillåten för skapade konton');
define('_SETTINGS_NEWLOGIN2',		'(endast för nya konton)');
define('_SETTINGS_MEMBERMSGS',		'Tillåt medlemsinteraktion');
define('_SETTINGS_LANGUAGE',		'Standardspråk');
define('_SETTINGS_DISABLESITE',		'Inaktivera webbsidan');
define('_SETTINGS_DBLOGIN',			'Inloggning för MySQL &amp; databas');
define('_SETTINGS_UPDATE',			'Uppdatera inställningar');
define('_SETTINGS_UPDATE_BTN',		'Uppdatera inställningar');
define('_SETTINGS_DISABLEJS',		'Inaktivera verktygsfält i Java');
define('_SETTINGS_MEDIA',			'Inställningar för mediauppladdning');
define('_SETTINGS_MEDIAPREFIX',		'Förstava uppladdade filer med datum');
define('_SETTINGS_MEMBERS',			'Medlemsinställningar');

// bans
define('_BAN_TITLE',				'Ban-lista för');
define('_BAN_NONE',					'Inga bannar för denna blogg');
define('_BAN_NEW_TITLE',			'Lägg till ban');
define('_BAN_NEW_TEXT',				'Lägg till en ban nu');
define('_BAN_REMOVE_TITLE',			'Ta bort ban');
define('_BAN_IPRANGE',				'IP-serie');
define('_BAN_BLOGS',				'Vilken blogg?');
define('_BAN_DELETE_TITLE',			'Ta bort ban');
define('_BAN_ALLBLOGS',				'Alla bloggar som du har admin-rättgheter för.');
define('_BAN_REMOVED_TITLE',		'Bannen borttagen');
define('_BAN_REMOVED_TEXT',			'Bannentogs bort i följande bloggar:');
define('_BAN_ADD_TITLE',			'Lägg till ban');
define('_BAN_IPRANGE_TEXT',			'Välj IP-serie som du vill spärra.');
define('_BAN_BLOGS_TEXT',			'Du kan välja att banna i en blogg eller alla bloggar som du är admin för.');
define('_BAN_REASON_TITLE',			'Anledning');
define('_BAN_REASON_TEXT',			'Du kan motivera bannen, vilken sedan visas för den aktuella personen.');
define('_BAN_ADD_BTN',				'Lägg till ban');

// LOGIN screen
define('_LOGIN_MESSAGE',			'Meddelande');
define('_LOGIN_NAME',				'Namn');
define('_LOGIN_PASSWORD',			'Lösenord');
define('_LOGIN_SHARED',				_LOGINFORM_SHARED);
define('_LOGIN_FORGOT',				'Glömt lösenordet?');

// membermanagement
define('_MEMBERS_TITLE',			'Medlemshantering');
define('_MEMBERS_CURRENT',			'Aktuella medlemmar');
define('_MEMBERS_NEW',				'Ny medlem');
define('_MEMBERS_DISPLAY',			'Skärmnamn');
define('_MEMBERS_DISPLAY_INFO',		'(inloggningsnamn)');
define('_MEMBERS_REALNAME',			'Verkligt namn');
define('_MEMBERS_PWD',				'Lösenord');
define('_MEMBERS_REPPWD',			'Bekräfta lösenord');
define('_MEMBERS_EMAIL',			'Mejladress');
define('_MEMBERS_EMAIL_EDIT',		'(Om du ändrar mejladress, kommer ett nytt lösenord att skickas ut)');
define('_MEMBERS_URL',				'Hemsideadress (URL)');
define('_MEMBERS_SUPERADMIN',		'Admin-rättigheter');
define('_MEMBERS_CANLOGIN',			'Kan logga in till admin');
define('_MEMBERS_NOTES',			'Noteringar');
define('_MEMBERS_NEW_BTN',			'Lägg till medlem');
define('_MEMBERS_EDIT',				'Redigera medlem');
define('_MEMBERS_EDIT_BTN',			'Ändra inställningar');
define('_MEMBERS_BACKTOOVERVIEW',	'Tillbaka till medlemsöversikten');
define('_MEMBERS_DEFLANG',			'Språk');
define('_MEMBERS_USESITELANG',		'- använd sidans inställningar -');

// List of blogs (TT = tooltip)
define('_BLOGLIST_TT_VISIT',		'Besök sida');
define('_BLOGLIST_ADD',				'Lägg till inlägg');
define('_BLOGLIST_TT_ADD',			'Lägg till inlägg i denna blogg');
define('_BLOGLIST_EDIT',			'Redigera/ta bort inlägg');
define('_BLOGLIST_TT_EDIT',			'');
define('_BLOGLIST_BMLET',			'Bokmärke');
define('_BLOGLIST_TT_BMLET',		'');
define('_BLOGLIST_SETTINGS',		'Inställningar');
define('_BLOGLIST_TT_SETTINGS',		'Redigera inställningarna eller hantera team');
define('_BLOGLIST_BANS',			'Bannar');
define('_BLOGLIST_TT_BANS',			'Visa, lägg till eller ta bort bannade IP');
define('_BLOGLIST_DELETE',			'Radera alla');
define('_BLOGLIST_TT_DELETE',		'Radera denna blogg');

// OVERVIEW screen
define('_OVERVIEW_YRBLOGS',			'Dina bloggar');
define('_OVERVIEW_YRDRAFTS',		'Dina utkast');
define('_OVERVIEW_YRSETTINGS',		'Dina inställningar');
define('_OVERVIEW_GSETTINGS',		'Generella inställningar');
define('_OVERVIEW_NOBLOGS',			'Du tillhör inte någon bloggs teamlista');
define('_OVERVIEW_NODRAFTS',		'Inga utkast');
define('_OVERVIEW_EDITSETTINGS',	'Redigera dina inställningar...');
define('_OVERVIEW_BROWSEITEMS',		'Bläddra bland dina inlägg...');
define('_OVERVIEW_BROWSECOMM',		'Bläddra bland dina kommentarer...');
define('_OVERVIEW_VIEWLOG',			'Visa händelse-logg...');
define('_OVERVIEW_MEMBERS',			'Hantera medlemmar...');
define('_OVERVIEW_NEWLOG',			'Skapa ny blogg...');
define('_OVERVIEW_SETTINGS',		'Redigera inställningar...');
define('_OVERVIEW_TEMPLATES',		'Redigera mallar...');
define('_OVERVIEW_SKINS',			'Redigera Skins...');
define('_OVERVIEW_BACKUP',			'Backup/Återställ...');

// ITEMLIST
define('_ITEMLIST_BLOG',			'Inlägg i bloggen');
define('_ITEMLIST_YOUR',			'Dina inlägg');

// Comments
define('_COMMENTS',					'Kommentarer');
define('_NOCOMMENTS',				'Inga kommentarer på detta inlägg');
define('_COMMENTS_YOUR',			'Dina kommentarer');
define('_NOCOMMENTS_YOUR',			'Du har inte skrivit några kommentarer');

// LISTS (general)
define('_LISTS_NOMORE',				'Inga fler resultat, eller inga resultat överhuvutaget');
define('_LISTS_PREV',				'Föregående');
define('_LISTS_NEXT',				'Nästa');
define('_LISTS_SEARCH',				'Sök');
define('_LISTS_CHANGE',				'Ändra');
define('_LISTS_PERPAGE',			'inlägg/sida');
define('_LISTS_ACTIONS',			'Händelser');
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
define('_LIST_MEMBER_NAME',			'Skärmnamn');
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
define('_LIST_COMMENT_WHO',			'Författare');
define('_LIST_COMMENT',				'Kommentar');
define('_LIST_COMMENT_HOST',		'Värd');

// itemlist
define('_LIST_ITEM_INFO',			'Info');
define('_LIST_ITEM_CONTENT',		'Titel och text');


// teamlist
define('_LIST_TEAM_ADMIN',			'Admin ');
define('_LIST_TEAM_CHADMIN',		'Ändra Admin');

// edit comments
define('_EDITC_TITLE',				'Redigera kommentarer');
define('_EDITC_WHO',				'Författare');
define('_EDITC_HOST',				'Varifrån?');
define('_EDITC_WHEN',				'När?');
define('_EDITC_TEXT',				'Text');
define('_EDITC_EDIT',				'Redigera kommentar');
define('_EDITC_MEMBER',				'medlem');
define('_EDITC_NONMEMBER',			'icke-medlem');

// move item
define('_MOVE_TITLE',				'Flytta till vilken blogg?');
define('_MOVE_BTN',					'Flytta');

?>


