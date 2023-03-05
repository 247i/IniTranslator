<?php
/**
* @version $Id: swedish.php 1.0.9 2006-06-06 Sune Hultman, Joomla Swedish Translation Team http://www.svenskjoomla.se $
* @package Joomla
* @copyright Copyright (C) 2005 Open Source Matters. All rights reserved.
* @license http://www.gnu.org/copyleft/gpl.html GNU/GPL, see LICENSE.php
* Joomla! is free software. This version may have been modified pursuant
* to the GNU General Public License, and as distributed it includes or
* is derivative of works licensed under the GNU General Public License or
* other free or open source software licenses.
* See COPYRIGHT.php for copyright notices and details.
*/

// no direct access
defined( '_VALID_MOS' ) or die( 'Restricted access' );

// Site page note found
define( '_404', 'Sidan du s�ker finns inte.' );
define( '_404_RTS', 'G� tillbaka' );

/** common */
DEFINE('_LANGUAGE','sv');
DEFINE('_NOT_AUTH','Du har inte beh�righet att visa den h�r sidan.');
DEFINE('_DO_LOGIN','Du m�ste logga in.');
DEFINE('_VALID_AZ09',"Ange ett giltigt %s.  Inga mellanslag, mer �n %d tecken och inneh�llande 0-9,a-z,A-Z");
DEFINE('_VALID_AZ09_USER',"PAnge ett giltigt %s.  Mer �n %d tecken och inneh�llande 0-9,a-z,A-Z");
DEFINE('_CMN_YES','Ja');
DEFINE('_CMN_NO','Nej');
DEFINE('_CMN_SHOW','Visa');
DEFINE('_CMN_HIDE','D�lj');

DEFINE('_CMN_NAME','Namn');
DEFINE('_CMN_DESCRIPTION','Beskrivning');
DEFINE('_CMN_SAVE','Spara');
DEFINE('_CMN_APPLY','Verkst�ll');
DEFINE('_CMN_CANCEL','Avbryt');
DEFINE('_CMN_PRINT','Skriv ut');
DEFINE('_CMN_PDF','PDF');
DEFINE('_CMN_EMAIL','E-post');
DEFINE('_ICON_SEP','|');
DEFINE('_CMN_PARENT','Upp�t');
DEFINE('_CMN_ORDERING','Sortering');
DEFINE('_CMN_ACCESS','�tkomstniv�');
DEFINE('_CMN_SELECT','V�lj');

DEFINE('_CMN_NEXT','N�sta');
DEFINE('_CMN_NEXT_ARROW'," &gt;&gt;");
DEFINE('_CMN_PREV','F�reg�ende');
DEFINE('_CMN_PREV_ARROW',"&lt;&lt; ");

DEFINE('_CMN_SORT_NONE','Ingen sortering');
DEFINE('_CMN_SORT_ASC','Sortera stigande');
DEFINE('_CMN_SORT_DESC','Sortera fallande');

DEFINE('_CMN_NEW','Ny');
DEFINE('_CMN_NONE','Ingen');
DEFINE('_CMN_LEFT','V�nster');
DEFINE('_CMN_RIGHT','H�ger');
DEFINE('_CMN_CENTER','Centrera');
DEFINE('_CMN_ARCHIVE','Arkivera');
DEFINE('_CMN_UNARCHIVE','�terst�ll fr�n arkiv');
DEFINE('_CMN_TOP','�verst');
DEFINE('_CMN_BOTTOM','Underst');

DEFINE('_CMN_PUBLISHED','Publicerad');
DEFINE('_CMN_UNPUBLISHED','Ej publicerad');

DEFINE('_CMN_EDIT_HTML','�ndra HTML');
DEFINE('_CMN_EDIT_CSS','�ndra CSS');

DEFINE('_CMN_DELETE','Radera');

DEFINE('_CMN_FOLDER','Mapp');
DEFINE('_CMN_SUBFOLDER','Undermapp');
DEFINE('_CMN_OPTIONAL','Valfri');
DEFINE('_CMN_REQUIRED','Obligatorisk');

DEFINE('_CMN_CONTINUE','Forts�tt');

DEFINE('_STATIC_CONTENT','Statiskt inneh�ll');

DEFINE('_CMN_NEW_ITEM_LAST','Nya artiklar placeras som standard sist. Du kan �ndra ordningen n�r du har sparat artikeln.');
DEFINE('_CMN_NEW_ITEM_FIRST','Nya artiklar placeras som standard f�rst.  Du kan �ndra ordningen n�r du har sparat artikeln.');
DEFINE('_LOGIN_INCOMPLETE','Fyll i anv�ndarnamn och l�senord.');
DEFINE('_LOGIN_BLOCKED','Ditt konto har sp�rrats. Kontakta administrat�ren.');
DEFINE('_LOGIN_INCORRECT','Felaktigt anv�ndarnamn eller l�senord. F�rs�k igen.');
DEFINE('_LOGIN_NOADMINS','Du kan inte logga in. Det finns inga administrat�rer registrerade.');
DEFINE('_CMN_JAVASCRIPT','!Varning! Javascript m�ste vara aktiverat f�r korrekt visning.');

DEFINE('_NEW_MESSAGE','Du har f�tt ett nytt privat meddelande.');
DEFINE('_MESSAGE_FAILED','Anv�ndaren har l�st sin e-postl�da. Det gick inte att skicka meddelande.');

DEFINE('_CMN_IFRAMES', 'Den h�r funktionen kommer inte att fungera korrekt.  Din webbl�sare st�der inte infogade ramar.');

DEFINE('_INSTALL_WARN','Av s�kerhetssk�l b�r du radera installationsmappen inklusive alla filer och undermappar - uppdatera sedan den h�r sidan');
DEFINE('_TEMPLATE_WARN','<font color=\"red\"><b>Hittade inte stilmallen! Letar efter stilmall:</b></font>');
DEFINE('_NO_PARAMS','Det finns inga parametrar f�r det h�r objektet');
DEFINE('_HANDLER','Hanterare �r ej definierad f�r typen');

/** mambots */
DEFINE('_TOC_JUMPTO','Artikelindex');

/**  content */
DEFINE('_READ_MORE','L�s mer...');
DEFINE('_READ_MORE_REGISTER','Du m�ste logga in f�r att l�sa mer...');
DEFINE('_MORE','Mer...');
DEFINE('_ON_NEW_CONTENT', "En ny artikel har lagts till av [ %s ]  med titeln [ %s ]  fr�n sektion [ %s ]  och kategori  [ %s ]" );
DEFINE('_SEL_CATEGORY','- V�lj kategori -');
DEFINE('_SEL_SECTION','- V�lj sektion -');
DEFINE('_SEL_AUTHOR','- V�lj f�rfattare -');
DEFINE('_SEL_POSITION','- V�lj position -');
DEFINE('_SEL_TYPE','- V�lj typ -');
DEFINE('_EMPTY_CATEGORY','Den h�r kategorin �r tom just nu');
DEFINE('_EMPTY_BLOG','Det finns ingenting att visa');
DEFINE('_NOT_EXIST','Sidan du f�rs�ker n� finns inte.<br />V�lj en sida fr�n menyn.');

/** classes/html/modules.php */
DEFINE('_BUTTON_VOTE','R�sta');
DEFINE('_BUTTON_RESULTS','Resultat');
DEFINE('_USERNAME','Anv�ndarnamn');
DEFINE('_LOST_PASSWORD','Gl�mt ditt l�senord?');
DEFINE('_PASSWORD','L�senord');
DEFINE('_BUTTON_LOGIN','Logga in');
DEFINE('_BUTTON_LOGOUT','Logga ut');
DEFINE('_NO_ACCOUNT','Inget konto �n?');
DEFINE('_CREATE_ACCOUNT','Skapa ett');
DEFINE('_VOTE_POOR','D�ligt');
DEFINE('_VOTE_BEST','Bra');
DEFINE('_USER_RATING','Anv�ndarna tycker:');
DEFINE('_RATE_BUTTON','Tyck till!');
DEFINE('_REMEMBER_ME','Kom ih�g mig');

/** contact.php */
DEFINE('_ENQUIRY','F�rfr�gan');
DEFINE('_ENQUIRY_TEXT','Det h�r �r en f�rfr�gan fr�n');
DEFINE('_COPY_TEXT','Det h�r �r en kopia av f�ljande meddelande som du har skickat till administrat�ren f�r %s');
DEFINE('_COPY_SUBJECT','Kopia av: ');
DEFINE('_THANK_MESSAGE','Tack f�r din e-post');
DEFINE('_CLOAKING','Den h�r e-postadressen �r skyddad fr�n spam bots, du m�ste ha Javascript aktiverat f�r att visa det');
DEFINE('_CONTACT_HEADER_NAME','Namn');
DEFINE('_CONTACT_HEADER_POS','Position');
DEFINE('_CONTACT_HEADER_EMAIL','E-post');
DEFINE('_CONTACT_HEADER_PHONE','Telefon');
DEFINE('_CONTACT_HEADER_FAX','Fax');
DEFINE('_CONTACTS_DESC','Kontaktlistan f�r den h�r webbplatsen.');
DEFINE('_CONTACT_MORE_THAN','Du kan inte ange mer �n en e-postadress.');

/** classes/html/contact.php */
DEFINE('_CONTACT_TITLE','Kontakt');
DEFINE('_EMAIL_DESCRIPTION','Skicka ett meddelande:');
DEFINE('_NAME_PROMPT',' Ditt namn:');
DEFINE('_EMAIL_PROMPT',' Din e-postadress:');
DEFINE('_MESSAGE_PROMPT',' Ditt meddelande:');
DEFINE('_SEND_BUTTON','Skicka');
DEFINE('_CONTACT_FORM_NC','Kontrollera att formul�ret �r komplett och korrekt ifyllt.');
DEFINE('_CONTACT_TELEPHONE','Telefon: ');
DEFINE('_CONTACT_MOBILE','Mobil: ');
DEFINE('_CONTACT_FAX','Fax: ');
DEFINE('_CONTACT_EMAIL','E-post: ');
DEFINE('_CONTACT_NAME','Namn: ');
DEFINE('_CONTACT_POSITION','Befattning: ');
DEFINE('_CONTACT_ADDRESS','Adress: ');
DEFINE('_CONTACT_MISC','Information: ');
DEFINE('_CONTACT_SEL','V�lj kontakt:');
DEFINE('_CONTACT_NONE','Det finns inga kontaktuppgifter att visa.');
DEFINE('_CONTACT_ONE_EMAIL','Du kan inte ange mer �n en e-postadress.');
DEFINE('_EMAIL_A_COPY','Skicka en kopia av detta meddelande till dig sj�lv');
DEFINE('_CONTACT_DOWNLOAD_AS','Ladda ner informationen som en');
DEFINE('_VCARD','VCard');

/** pageNavigation */
DEFINE('_PN_LT','&lt;'); 
DEFINE('_PN_RT','&gt;'); 
DEFINE('_PN_PAGE','Sida');
DEFINE('_PN_OF','av');
DEFINE('_PN_START','F�rsta');
DEFINE('_PN_PREVIOUS','F�reg�ende');
DEFINE('_PN_NEXT','N�sta');
DEFINE('_PN_END','Sista');
DEFINE('_PN_DISPLAY_NR','Visa #');
DEFINE('_PN_RESULTS','Resultat');

/** emailfriend */
DEFINE('_EMAIL_TITLE','Tipsa en v�n');
DEFINE('_EMAIL_FRIEND','Skicka den h�r sidan till en v�n.');
DEFINE('_EMAIL_FRIEND_ADDR','Din v�ns e-postadress:');
DEFINE('_EMAIL_YOUR_NAME','Ditt namn:');
DEFINE('_EMAIL_YOUR_MAIL','Din e-postadress:');
DEFINE('_SUBJECT_PROMPT',' �rende:');
DEFINE('_BUTTON_SUBMIT_MAIL','Skicka');
DEFINE('_BUTTON_CANCEL','Avbryt');
DEFINE('_EMAIL_ERR_NOINFO','B�de din och din v�ns e-postadresser m�ste vara korrekt ifyllda.');
DEFINE('_EMAIL_MSG',' Den h�r sidan fr�n "%s" har skickats till dig av %s ( %s ).

Du hittar sidan h�r: 
%s');
DEFINE('_EMAIL_INFO','Skickat av');
DEFINE('_EMAIL_SENT','Skickat till');
DEFINE('_PROMPT_CLOSE','St�ng f�nstret');

/** classes/html/content.php */
DEFINE('_AUTHOR_BY', ' Bidrag fr�n');
DEFINE('_WRITTEN_BY', ' Skrivet av');
DEFINE('_LAST_UPDATED', 'Senast uppdaterad');
DEFINE('_BACK','[ Tillbaka ]');
DEFINE('_LEGEND','Inneh�ll');
DEFINE('_DATE','Datum');
DEFINE('_ORDER_DROPDOWN','Sortering');
DEFINE('_HEADER_TITLE','Titel');
DEFINE('_HEADER_AUTHOR','F�rfattare');
DEFINE('_HEADER_SUBMITTED','Skickad');
DEFINE('_HEADER_HITS','Tr�ffar');
DEFINE('_E_EDIT','�ndra');
DEFINE('_E_ADD','L�gg till');
DEFINE('_E_WARNUSER','V�lj Spara eller Avbryt');
DEFINE('_E_WARNTITLE','Artikeln m�ste ha en titel');
DEFINE('_E_WARNTEXT','Artikeln m�ste ha en ingress');
DEFINE('_E_WARNCAT','Ange kategori');
DEFINE('_E_CONTENT','Inneh�ll');
DEFINE('_E_TITLE','Titel:');
DEFINE('_E_CATEGORY','Kategori:');
DEFINE('_E_INTRO','Ingress');
DEFINE('_E_MAIN','Br�dtext');
DEFINE('_E_MOSIMAGE','INSERT {mosimage}');
DEFINE('_E_IMAGES','Bilder');
DEFINE('_E_GALLERY_IMAGES','Galleribilder');
DEFINE('_E_CONTENT_IMAGES','Artikelbilder');
DEFINE('_E_EDIT_IMAGE','�ndra bild');
DEFINE('_E_NO_IMAGE','Ingen bild');
DEFINE('_E_INSERT','Infoga');
DEFINE('_E_UP','Upp');
DEFINE('_E_DOWN','Ner');
DEFINE('_E_REMOVE','Ta bort');
DEFINE('_E_SOURCE','K�lla:');
DEFINE('_E_ALIGN','Justering:');
DEFINE('_E_ALT','Alternativ text:');
DEFINE('_E_BORDER','Ram:');
DEFINE('_E_CAPTION','Rubrik');
DEFINE('_E_CAPTION_POSITION','Rubrikposition');
DEFINE('_E_CAPTION_ALIGN','Rubrikanpassning');
DEFINE('_E_CAPTION_WIDTH','Rubrikbredd');
DEFINE('_E_APPLY','Godk�nn');
DEFINE('_E_PUBLISHING','Publicering');
DEFINE('_E_STATE','Status:');
DEFINE('_E_AUTHOR_ALIAS','F�rfattarens Alias:');
DEFINE('_E_ACCESS_LEVEL','�tkomstniv�:');
DEFINE('_E_ORDERING','Sortering:');
DEFINE('_E_START_PUB','Starta publicering:');
DEFINE('_E_FINISH_PUB','Avsluta publicering:');
DEFINE('_E_SHOW_FP','Visa p� f�rstasidan:');
DEFINE('_E_HIDE_TITLE','D�lj artikelns titel:');
DEFINE('_E_METADATA','Metadata');
DEFINE('_E_M_DESC','Beskrivning:');
DEFINE('_E_M_KEY','Nyckelord:');
DEFINE('_E_SUBJECT','�rende:');
DEFINE('_E_EXPIRES','Utg�ngsdatum:');
DEFINE('_E_VERSION','Version:');
DEFINE('_E_ABOUT','Om');
DEFINE('_E_CREATED','Skapad:');
DEFINE('_E_LAST_MOD','Senast �ndrad:');
DEFINE('_E_HITS','Tr�ffar:');
DEFINE('_E_SAVE','Spara');
DEFINE('_E_CANCEL','�ngra');
DEFINE('_E_REGISTERED','Endast f�r registrerade anv�ndare');
DEFINE('_E_ITEM_INFO','Artikelinformation');
DEFINE('_E_ITEM_SAVED','Artikeln �r sparad.');
DEFINE('_ITEM_PREVIOUS','&lt; F�reg�ende');
DEFINE('_ITEM_NEXT','N�sta &gt;');
DEFINE('_KEY_NOT_FOUND','Hittade inte s�kord');


/** content.php */
DEFINE('_SECTION_ARCHIVE_EMPTY','Det finns ingenting i det h�r arkivet just nu. V�lkommen tillbaka senare.');
DEFINE('_CATEGORY_ARCHIVE_EMPTY','Det finns ingenting i det h�r arkivet just nu. V�lkommen tillbaka senare.');
DEFINE('_HEADER_SECTION_ARCHIVE','Sektion - Arkiv');
DEFINE('_HEADER_CATEGORY_ARCHIVE','Kategori - Arkiv');
DEFINE('_ARCHIVE_SEARCH_FAILURE','Det finns inga arkiverade artiklar fr�n %s %s');	// values are month then year
DEFINE('_ARCHIVE_SEARCH_SUCCESS','H�r �r de arkiverade artiklarna fr�n %s %s');	// values are month then year
DEFINE('_FILTER','Filter');
DEFINE('_ORDER_DROPDOWN_DA','Datum stigande');
DEFINE('_ORDER_DROPDOWN_DD','Datum fallande');
DEFINE('_ORDER_DROPDOWN_TA','Titel stigande');
DEFINE('_ORDER_DROPDOWN_TD','Titel fallande');
DEFINE('_ORDER_DROPDOWN_HA','Tr�ffar stigande');
DEFINE('_ORDER_DROPDOWN_HD','Tr�ffar fallande');
DEFINE('_ORDER_DROPDOWN_AUA','F�rfattare stigande');
DEFINE('_ORDER_DROPDOWN_AUD','F�rfattare fallande');
DEFINE('_ORDER_DROPDOWN_O','Sortering');

/** poll.php */
DEFINE('_ALERT_ENABLED','Cookies m�ste vara aktiverade i din webbl�sare!');
DEFINE('_ALREADY_VOTE','Du (eller n�gon annan som anv�nder samma dator) har redan r�stat en g�ng idag!');
DEFINE('_NO_SELECTION','Du har inte gjort n�got val, f�rs�k igen');
DEFINE('_THANKS','Tack f�r din r�st!');
DEFINE('_SELECT_POLL','V�lj fr�ga fr�n listan');

/** classes/html/poll.php */
DEFINE('_JAN','Januari');
DEFINE('_FEB','Februari');
DEFINE('_MAR','Mars');
DEFINE('_APR','April');
DEFINE('_MAY','Maj');
DEFINE('_JUN','Juni');
DEFINE('_JUL','Juli');
DEFINE('_AUG','Augusti');
DEFINE('_SEP','September');
DEFINE('_OCT','Oktober');
DEFINE('_NOV','November');
DEFINE('_DEC','December');
DEFINE('_POLL_TITLE','Webbfr�ga - Resultat');
DEFINE('_SURVEY_TITLE','Webbfr�ga - Titel:');
DEFINE('_NUM_VOTERS','Antal r�ster');
DEFINE('_FIRST_VOTE','F�rsta r�st');
DEFINE('_LAST_VOTE','Senaste r�st');
DEFINE('_SEL_POLL','V�lj fr�ga:');
DEFINE('_NO_RESULTS','Det finns inga resultat f�r den h�r fr�gan.');

/** registration.php */
DEFINE('_ERROR_PASS','Tyv�rr, hittar inte anv�ndaren.');
DEFINE('_NEWPASS_MSG','Anv�ndaren $checkusername har den h�r e-postadressen.\n'
.'En bes�kare fr�n $mosConfig_live_site har just beg�rt ett nytt l�senord.\n\n'
.' Ditt nya l�senord �r: $newpass\n\nOm du inte har beg�rt n�got nytt l�senord, finns �nd� ingen anledning till oro.'
.' Det �r bara du som kan se det h�r meddelandet, ingen annan. Om det h�r har blivit fel, logga bara in med det'
.' nya l�senordet, sedan kan du byta till ett nytt l�senord du sj�lv vill ha.');
DEFINE('_NEWPASS_SUB','$_sitename :: Nytt l�senord f�r - $checkusername');
DEFINE('_NEWPASS_SENT','Nytt l�senord skapat och skickat!');
DEFINE('_REGWARN_NAME','Ange ditt namn.');
DEFINE('_REGWARN_UNAME','Ange ett anv�ndarnamn.');
DEFINE('_REGWARN_MAIL','Ange en giltig e-postadress.');
DEFINE('_REGWARN_PASS','Ange ett l�senord.  L�senordet f�r inte inneh�lla mellanslag, ska vara minst 6 tecken l�ngt och best� av 0-9,a-z,A-Z');
DEFINE('_REGWARN_VPASS1','Bekr�fta l�senordet.');
DEFINE('_REGWARN_VPASS2','L�senordet och bekr�ftelsen st�mmer inte, f�rs�k igen.');
DEFINE('_REGWARN_INUSE','Det h�r anv�ndarnamnet/l�senordet anv�nds redan. F�rs�k med n�got annat.');
DEFINE('_REGWARN_EMAIL_INUSE', 'Den h�r e-postadressen �r redan registrerad. Om du har gl�mt l�senordet, klicka p� "Gl�mt ditt l�senord?" s� kommer ett nytt l�senord att skickas till dig.');
DEFINE('_SEND_SUB','Kontouppgifter f�r %s at %s');
DEFINE('_USEND_MSG_ACTIVATE', 'Hej %s,

Tack f�r att du har registrerat dig p� %s. Ditt konto �r skapat och m�ste aktiveras innan du kan anv�nda det.
F�r att aktivera kontot, klicka p� nedanst�ende l�nk eller klipp och klistra in den i din webbl�sare:
%s

Efter aktivering kan du logga in p� %s med nedanst�ende anv�ndarnamn och l�senord:

Anv�ndarnamn - %s
L�senord - %s');
DEFINE('_USEND_MSG', "Hej %s,

Tack f�r att du har registrerat dig p� %s.

Du kan nu logga in p� %s med det anv�ndarnamn och l�senord du registrerade dig med.");
DEFINE('_USEND_MSG_NOPASS','Hej $name,\n\nDu �r nu upplagd som anv�ndare p� $mosConfig_live_site.\n'
.'Du kan logga in p� $mosConfig_live_site med det anv�ndarnamn och l�senord du angav n�r du registrerade dig.\n\n'
.'Svara inte p� detta meddelande eftersom det �r automatiskt genererat och kommer inte att l�sas eller besvaras.\n');
DEFINE('_ASEND_MSG','Hej %s,

En ny anv�ndare har registrerat sig p� %s.
H�r �r anv�ndaruppgifterna:

Namn - %s
E-post - %s
Anv�ndarnamn - %s

Svara inte p� detta meddelande eftersom det �r automatiskt genererat och kommer inte att l�sas eller besvaras.');
DEFINE('_REG_COMPLETE_NOPASS','<div class="componentheading">Registreringen �r klar!</div><br />&nbsp;&nbsp;'
.'Du kan logga in nu.<br />&nbsp;&nbsp;');
DEFINE('_REG_COMPLETE', '<div class="componentheading">Registrering klar!</div><br />Du kan logga in nu.');
DEFINE('_REG_COMPLETE_ACTIVATE', '<div class="componentheading">Registreringen �r klar!</div><br />Ditt konto har skapats och en aktiveringsl�nk �r skickad till den e-postadress du har angett. Gl�m inte att du m�ste aktivera kontot genom att klicka p� aktiveringsl�nken i meddelandet du f�r, innan du kan logga in.');
DEFINE('_REG_ACTIVATE_COMPLETE', '<div class="componentheading">Activation Complete!</div><br />Ditt konto har aktiverats s� nu kan du logga in med det anv�ndarnamn och l�senord du har angett vid registreringen.');
DEFINE('_REG_ACTIVATE_NOT_FOUND', '<div class="componentheading">Ogiltig aktiveringsl�nk!</div><br />Kontot finns inte i v�r databas eller s� �r kontot redan aktiverat.');

/** classes/html/registration.php */
DEFINE('_PROMPT_PASSWORD','Gl�mt ditt l�senord?');
DEFINE('_NEW_PASS_DESC','Ange anv�ndarnamn och e-postadress och klicka sedan p� knappen Skicka l�senord.<br />'
.'Du kommer strax att f� ett nytt l�senord.  Anv�nd det nya l�senordet f�r att logga in.');
DEFINE('_PROMPT_UNAME','Anv�ndarnamn:');
DEFINE('_PROMPT_EMAIL','E-post:');
DEFINE('_BUTTON_SEND_PASS','Skicka l�senord');
DEFINE('_REGISTER_TITLE','Registrering');
DEFINE('_REGISTER_NAME','Namn:');
DEFINE('_REGISTER_UNAME','Anv�ndarnamn:');
DEFINE('_REGISTER_EMAIL','E-post:');
DEFINE('_REGISTER_PASS','L�senord:');
DEFINE('_REGISTER_VPASS','Bekr�fta l�senord:');
DEFINE('_REGISTER_REQUIRED','F�lt markerade med en asterisk (*) �r obligatoriska.');
DEFINE('_BUTTON_SEND_REG','Skicka registrering');
DEFINE('_SENDING_PASSWORD','Ditt l�senord skickas till e-postadressen du angivit.<br />N�r du har f�tt ditt'
.' nya l�senord kan du logga in och �ndra det.');

/** classes/html/search.php */
DEFINE('_SEARCH_TITLE','S�k');
DEFINE('_PROMPT_KEYWORD','Nyckelord');
DEFINE('_SEARCH_MATCHES','Din s�kning gav %d tr�ffar');
DEFINE('_CONCLUSION','Totalt $totalRows tr�ffar.  S�k [ <b>$searchword</b> ] med');
DEFINE('_NOKEYWORD','Inga s�ktr�ffar');
DEFINE('_IGNOREKEYWORD','Ett eller flera vanligt f�rekommande ord ignorerades i s�kningen');
DEFINE('_SEARCH_ANYWORDS','N�got ord');
DEFINE('_SEARCH_ALLWORDS','Alla ord');
DEFINE('_SEARCH_PHRASE','Exakt fras');
DEFINE('_SEARCH_NEWEST','Nyaste f�rst');
DEFINE('_SEARCH_OLDEST','�ldsta f�rst');
DEFINE('_SEARCH_POPULAR','Mest popul�ra');
DEFINE('_SEARCH_ALPHABETICAL','Alfabetisk');
DEFINE('_SEARCH_CATEGORY','Sektion/Kategori');
DEFINE('_SEARCH_MESSAGE','S�kstr�ngen skall inneh�lla minst 3 tecken och h�gst 20 tecken'); 
DEFINE('_SEARCH_ARCHIVED','Arkiverad'); 
DEFINE('_SEARCH_CATBLOG','Kategoriblog'); 
DEFINE('_SEARCH_CATLIST','Kategorilista'); 
DEFINE('_SEARCH_NEWSFEEDS','Nyhetsmatning'); 
DEFINE('_SEARCH_SECLIST','Sektionslista'); 
DEFINE('_SEARCH_SECBLOG','Sektionsblog'); 


/** templates/*.php */
DEFINE('_ISO','charset=iso-8859-1');
DEFINE('_DATE_FORMAT','l, F d Y');  //Uses PHP's DATE Command Format - Depreciated
/**
* Modify this line to reflect how you want the date to appear in your site
*
*e.g. DEFINE("_DATE_FORMAT_LC","%A, %d %B %Y %H:%M"); //Uses PHP's strftime Command Format
*/
DEFINE('_DATE_FORMAT_LC',"%Y-%m-%d"); //Uses PHP's strftime Command Format
DEFINE('_DATE_FORMAT_LC2',"%Y-%m-%d,%H:%M:%S %Z Vecka:%V");
DEFINE('_SEARCH_BOX','S�k...');
DEFINE('_NEWSFLASH_BOX','Notiser!');
DEFINE('_MAINMENU_BOX','Huvudmeny');

/** classes/html/usermenu.php */
DEFINE('_UMENU_TITLE','Anv�ndarmeny');
DEFINE('_HI','Du �r inloggad som ');

/** user.php */
DEFINE('_SAVE_ERR','Fyll i alla f�lt.');
DEFINE('_THANK_SUB','Tack f�r ditt bidrag. En administrat�r kommer att granska det innan det publiceras p� webbplatsen.');
DEFINE('_THANK_SUB_PUB','Tack f�r ditt bidrag.');
DEFINE('_UP_SIZE','Du kan inte ladda upp filer som �r st�rre �n 15kb.');
DEFINE('_UP_EXISTS','Bild $userfile_name finns redan. D�p om filen och f�rs�k igen.');
DEFINE('_UP_COPY_FAIL','Kunde inte kopiera');
DEFINE('_UP_TYPE_WARN','Du kan bara ladda upp gif- eller jpg-bilder.');
DEFINE('_MAIL_SUB','Ny anv�ndare');
DEFINE('_MAIL_MSG','Hej $adminName,\n\nen ny anv�ndare $type, $title, har lagts upp av $author'
.' till $mosConfig_live_site.\n'
.'G� till $mosConfig_live_site/administrator f�r att kontrollera och godk�nna $type.\n\n'
.'Svara inte p� detta meddelande eftersom det �r automatiskt genererat och kommer inte att l�sas eller besvaras.\n');
DEFINE('_PASS_VERR1','Om du byter l�senord m�ste du bekr�fta det nya l�senordet.');
DEFINE('_PASS_VERR2','Om du byter l�senord m�ste det nya l�senordet matcha bekr�ftelsen.');
DEFINE('_UNAME_INUSE','Anv�ndarnamnet finns redan.');	
DEFINE('_UPDATE','Uppdatera');
DEFINE('_USER_DETAILS_SAVE','Dina inst�llningar har sparats.');
DEFINE('_USER_LOGIN','Anv�ndarlogin');

/** components/com_user */
DEFINE('_EDIT_TITLE','�ndra dina uppgifter');
DEFINE('_YOUR_NAME','Namn:');
DEFINE('_EMAIL','E-post:');
DEFINE('_UNAME','Alias:');
DEFINE('_PASS','L�senord:');
DEFINE('_VPASS','Bekr�fta l�senord:');
DEFINE('_SUBMIT_SUCCESS','Skickat!');
DEFINE('_SUBMIT_SUCCESS_DESC','Ditt bidrag har nu skickats. Det kommer att kontrolleras innan det publiceras p� webbplatsen.');
DEFINE('_WELCOME','V�lkommen!');
DEFINE('_WELCOME_DESC','V�lkommen till anv�ndarsektionen p� v�r webbplats');
DEFINE('_CONF_CHECKED_IN','Tidigare reserverade artiklar �r nu tillg�ngliga');
DEFINE('_CHECK_TABLE','Kontrollerar lista');
DEFINE('_CHECKED_IN','Tillg�ngliga ');
DEFINE('_CHECKED_IN_ITEMS',' artiklar');
DEFINE('_PASS_MATCH','L�senorden �r inte lika');

/** components/com_banners */
DEFINE('_BNR_CLIENT_NAME','Du m�ste v�lja ett namn p� klienten.');
DEFINE('_BNR_CONTACT','Du m�ste v�lja en kontaktperson f�r klienten.');
DEFINE('_BNR_VALID_EMAIL','Du m�ste v�lja en giltig e-postadress f�r klienten.');
DEFINE('_BNR_CLIENT','Du m�ste v�lja en klient,');
DEFINE('_BNR_NAME','Du m�ste v�lja ett namn f�r webbannonsen.');
DEFINE('_BNR_IMAGE','Du m�ste v�lja en bild f�r webbannonsen.');
DEFINE('_BNR_URL','Du m�ste v�lja en URL/anpassad kod f�r webbannonsen.');

/** components/com_login */
DEFINE('_ALREADY_LOGIN','Du har redan loggat in!');
DEFINE('_LOGOUT','Klicka h�r f�r att logga ut.');
DEFINE('_LOGIN_TEXT','Anv�nd login- och l�senordsf�lten bredvid f�r att beh�righet till allt inneh�ll.');
DEFINE('_LOGIN_SUCCESS','Du �r inloggad.');
DEFINE('_LOGOUT_SUCCESS','Du �r utloggad.');
DEFINE('_LOGIN_DESCRIPTION','Var v�nlig logga in f�r �tkomst av den privata delen av webbplatsen');
DEFINE('_LOGOUT_DESCRIPTION','Du �r just nu inloggad p� den privata delen av webbplatsen');

/** components/com_weblinks */
DEFINE('_WEBLINKS_TITLE','L�nkar');
DEFINE('_WEBLINKS_DESC','V�lj kategori i listan nedan. Klicka sedan p� l�nken till sidan du vill bes�ka.');
DEFINE('_HEADER_TITLE_WEBLINKS','L�nkar');
DEFINE('_SECTION','Sektion:');
DEFINE('_SUBMIT_LINK','L�gg till en l�nk');
DEFINE('_URL','Webbadress:');
DEFINE('_URL_DESC','Beskrivning:');
DEFINE('_NAME','Namn:');
DEFINE('_WEBLINK_EXIST','Det finns redan en l�nk med det namnet, f�rs�k igen.');
DEFINE('_WEBLINK_TITLE','Din l�nk m�ste ha en titel.');

/** components/com_newfeeds */
DEFINE('_FEED_NAME','Fl�desnamn');
DEFINE('_FEED_ARTICLES','Antal artiklar');
DEFINE('_FEED_LINK','Fl�desl�nk');

/** whos_online.php */
DEFINE('_WE_HAVE', 'Vi har ');
DEFINE('_AND', ' och ');
DEFINE('_GUEST_COUNT','%s g�st');
DEFINE('_GUESTS_COUNT','%s g�ster');
DEFINE('_MEMBER_COUNT','%s medlem');
DEFINE('_MEMBERS_COUNT','%s medlemmar');
DEFINE('_ONLINE',' online');
DEFINE('_NONE','Inga anv�ndare online');
/** modules/mod_random_image */
DEFINE('_NO_IMAGES','Inga bilder');

/** modules/mod_stats.php */
DEFINE('_TIME_STAT','Tid');
DEFINE('_MEMBERS_STAT','Medlemmar');
DEFINE('_HITS_STAT','Tr�ffar');
DEFINE('_NEWS_STAT','Nyheter');
DEFINE('_LINKS_STAT','L�nkar');
DEFINE('_VISITORS','Bes�kare');

/** /adminstrator/components/com_menus/admin.menus.html.php */
DEFINE('_MAINMENU_HOME','* Den f�rsta publicerade artikeln i den h�r menyn [huvudmeny] �r standard `Startsida` f�r den h�r webbplatsen *');
DEFINE('_MAINMENU_DEL','* Du kan inte `radera` den h�r menyn eftersom den beh�vs f�r att Joomla! skall fungera korrekt *');
DEFINE('_MENU_GROUP','* En del `menytyper` finns i mer �n en grupp *');


/** administrators/components/com_users */
DEFINE('_NEW_USER_MESSAGE_SUBJECT', 'Ny anv�ndare' );
DEFINE('_NEW_USER_MESSAGE', 'Hej %s,


Du har har lagts till som anv�ndare av %s av en administrat�r.

Detta meddelande inneh�ller ditt anv�ndarnamn och l�senord f�r att logga in p� %s:

Anv�ndarnamn - %s
L�senord - %s


Svara inte p� detta meddelande eftersom det �r automatiskt genererat och kommer inte att l�sas eller besvaras.');

/** administrators/components/com_massmail */
DEFINE('_MASSMAIL_MESSAGE', "Det h�r �r ett meddelande fr�n '%s'

Meddelande:
" );

/** includes/pdf.php */ 
DEFINE('_PDF_GENERATED','Genererad:'); 
DEFINE('_PDF_POWERED','Powered by Joomla!'); 


?>