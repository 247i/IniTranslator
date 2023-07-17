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
define( '_404', 'Sidan du söker finns inte.' );
define( '_404_RTS', 'Gå tillbaka' );

/** common */
DEFINE('_LANGUAGE','sv');
DEFINE('_NOT_AUTH','Du har inte behörighet att visa den här sidan.');
DEFINE('_DO_LOGIN','Du måste logga in.');
DEFINE('_VALID_AZ09',"Ange ett giltigt %s.  Inga mellanslag, mer än %d tecken och innehållande 0-9,a-z,A-Z");
DEFINE('_VALID_AZ09_USER',"PAnge ett giltigt %s.  Mer än %d tecken och innehållande 0-9,a-z,A-Z");
DEFINE('_CMN_YES','Ja');
DEFINE('_CMN_NO','Nej');
DEFINE('_CMN_SHOW','Visa');
DEFINE('_CMN_HIDE','Dölj');

DEFINE('_CMN_NAME','Namn');
DEFINE('_CMN_DESCRIPTION','Beskrivning');
DEFINE('_CMN_SAVE','Spara');
DEFINE('_CMN_APPLY','Verkställ');
DEFINE('_CMN_CANCEL','Avbryt');
DEFINE('_CMN_PRINT','Skriv ut');
DEFINE('_CMN_PDF','PDF');
DEFINE('_CMN_EMAIL','E-post');
DEFINE('_ICON_SEP','|');
DEFINE('_CMN_PARENT','Uppåt');
DEFINE('_CMN_ORDERING','Sortering');
DEFINE('_CMN_ACCESS','Åtkomstnivå');
DEFINE('_CMN_SELECT','Välj');

DEFINE('_CMN_NEXT','Nästa');
DEFINE('_CMN_NEXT_ARROW'," &gt;&gt;");
DEFINE('_CMN_PREV','Föregående');
DEFINE('_CMN_PREV_ARROW',"&lt;&lt; ");

DEFINE('_CMN_SORT_NONE','Ingen sortering');
DEFINE('_CMN_SORT_ASC','Sortera stigande');
DEFINE('_CMN_SORT_DESC','Sortera fallande');

DEFINE('_CMN_NEW','Ny');
DEFINE('_CMN_NONE','Ingen');
DEFINE('_CMN_LEFT','Vänster');
DEFINE('_CMN_RIGHT','Höger');
DEFINE('_CMN_CENTER','Centrera');
DEFINE('_CMN_ARCHIVE','Arkivera');
DEFINE('_CMN_UNARCHIVE','Återställ från arkiv');
DEFINE('_CMN_TOP','Överst');
DEFINE('_CMN_BOTTOM','Underst');

DEFINE('_CMN_PUBLISHED','Publicerad');
DEFINE('_CMN_UNPUBLISHED','Ej publicerad');

DEFINE('_CMN_EDIT_HTML','Ändra HTML');
DEFINE('_CMN_EDIT_CSS','Ändra CSS');

DEFINE('_CMN_DELETE','Radera');

DEFINE('_CMN_FOLDER','Mapp');
DEFINE('_CMN_SUBFOLDER','Undermapp');
DEFINE('_CMN_OPTIONAL','Valfri');
DEFINE('_CMN_REQUIRED','Obligatorisk');

DEFINE('_CMN_CONTINUE','Fortsätt');

DEFINE('_STATIC_CONTENT','Statiskt innehåll');

DEFINE('_CMN_NEW_ITEM_LAST','Nya artiklar placeras som standard sist. Du kan ändra ordningen när du har sparat artikeln.');
DEFINE('_CMN_NEW_ITEM_FIRST','Nya artiklar placeras som standard först.  Du kan ändra ordningen när du har sparat artikeln.');
DEFINE('_LOGIN_INCOMPLETE','Fyll i användarnamn och lösenord.');
DEFINE('_LOGIN_BLOCKED','Ditt konto har spärrats. Kontakta administratören.');
DEFINE('_LOGIN_INCORRECT','Felaktigt användarnamn eller lösenord. Försök igen.');
DEFINE('_LOGIN_NOADMINS','Du kan inte logga in. Det finns inga administratörer registrerade.');
DEFINE('_CMN_JAVASCRIPT','!Varning! Javascript måste vara aktiverat för korrekt visning.');

DEFINE('_NEW_MESSAGE','Du har fått ett nytt privat meddelande.');
DEFINE('_MESSAGE_FAILED','Användaren har låst sin e-postlåda. Det gick inte att skicka meddelande.');

DEFINE('_CMN_IFRAMES', 'Den här funktionen kommer inte att fungera korrekt.  Din webbläsare stöder inte infogade ramar.');

DEFINE('_INSTALL_WARN','Av säkerhetsskäl bör du radera installationsmappen inklusive alla filer och undermappar - uppdatera sedan den här sidan');
DEFINE('_TEMPLATE_WARN','<font color=\"red\"><b>Hittade inte stilmallen! Letar efter stilmall:</b></font>');
DEFINE('_NO_PARAMS','Det finns inga parametrar för det här objektet');
DEFINE('_HANDLER','Hanterare är ej definierad för typen');

/** mambots */
DEFINE('_TOC_JUMPTO','Artikelindex');

/**  content */
DEFINE('_READ_MORE','Läs mer...');
DEFINE('_READ_MORE_REGISTER','Du måste logga in för att läsa mer...');
DEFINE('_MORE','Mer...');
DEFINE('_ON_NEW_CONTENT', "En ny artikel har lagts till av [ %s ]  med titeln [ %s ]  från sektion [ %s ]  och kategori  [ %s ]" );
DEFINE('_SEL_CATEGORY','- Välj kategori -');
DEFINE('_SEL_SECTION','- Välj sektion -');
DEFINE('_SEL_AUTHOR','- Välj författare -');
DEFINE('_SEL_POSITION','- Välj position -');
DEFINE('_SEL_TYPE','- Välj typ -');
DEFINE('_EMPTY_CATEGORY','Den här kategorin är tom just nu');
DEFINE('_EMPTY_BLOG','Det finns ingenting att visa');
DEFINE('_NOT_EXIST','Sidan du försöker nå finns inte.<br />Välj en sida från menyn.');

/** classes/html/modules.php */
DEFINE('_BUTTON_VOTE','Rösta');
DEFINE('_BUTTON_RESULTS','Resultat');
DEFINE('_USERNAME','Användarnamn');
DEFINE('_LOST_PASSWORD','Glömt ditt lösenord?');
DEFINE('_PASSWORD','Lösenord');
DEFINE('_BUTTON_LOGIN','Logga in');
DEFINE('_BUTTON_LOGOUT','Logga ut');
DEFINE('_NO_ACCOUNT','Inget konto än?');
DEFINE('_CREATE_ACCOUNT','Skapa ett');
DEFINE('_VOTE_POOR','Dåligt');
DEFINE('_VOTE_BEST','Bra');
DEFINE('_USER_RATING','Användarna tycker:');
DEFINE('_RATE_BUTTON','Tyck till!');
DEFINE('_REMEMBER_ME','Kom ihåg mig');

/** contact.php */
DEFINE('_ENQUIRY','Förfrågan');
DEFINE('_ENQUIRY_TEXT','Det här är en förfrågan från');
DEFINE('_COPY_TEXT','Det här är en kopia av följande meddelande som du har skickat till administratören för %s');
DEFINE('_COPY_SUBJECT','Kopia av: ');
DEFINE('_THANK_MESSAGE','Tack för din e-post');
DEFINE('_CLOAKING','Den här e-postadressen är skyddad från spam bots, du måste ha Javascript aktiverat för att visa det');
DEFINE('_CONTACT_HEADER_NAME','Namn');
DEFINE('_CONTACT_HEADER_POS','Position');
DEFINE('_CONTACT_HEADER_EMAIL','E-post');
DEFINE('_CONTACT_HEADER_PHONE','Telefon');
DEFINE('_CONTACT_HEADER_FAX','Fax');
DEFINE('_CONTACTS_DESC','Kontaktlistan för den här webbplatsen.');
DEFINE('_CONTACT_MORE_THAN','Du kan inte ange mer än en e-postadress.');

/** classes/html/contact.php */
DEFINE('_CONTACT_TITLE','Kontakt');
DEFINE('_EMAIL_DESCRIPTION','Skicka ett meddelande:');
DEFINE('_NAME_PROMPT',' Ditt namn:');
DEFINE('_EMAIL_PROMPT',' Din e-postadress:');
DEFINE('_MESSAGE_PROMPT',' Ditt meddelande:');
DEFINE('_SEND_BUTTON','Skicka');
DEFINE('_CONTACT_FORM_NC','Kontrollera att formuläret är komplett och korrekt ifyllt.');
DEFINE('_CONTACT_TELEPHONE','Telefon: ');
DEFINE('_CONTACT_MOBILE','Mobil: ');
DEFINE('_CONTACT_FAX','Fax: ');
DEFINE('_CONTACT_EMAIL','E-post: ');
DEFINE('_CONTACT_NAME','Namn: ');
DEFINE('_CONTACT_POSITION','Befattning: ');
DEFINE('_CONTACT_ADDRESS','Adress: ');
DEFINE('_CONTACT_MISC','Information: ');
DEFINE('_CONTACT_SEL','Välj kontakt:');
DEFINE('_CONTACT_NONE','Det finns inga kontaktuppgifter att visa.');
DEFINE('_CONTACT_ONE_EMAIL','Du kan inte ange mer än en e-postadress.');
DEFINE('_EMAIL_A_COPY','Skicka en kopia av detta meddelande till dig själv');
DEFINE('_CONTACT_DOWNLOAD_AS','Ladda ner informationen som en');
DEFINE('_VCARD','VCard');

/** pageNavigation */
DEFINE('_PN_LT','&lt;'); 
DEFINE('_PN_RT','&gt;'); 
DEFINE('_PN_PAGE','Sida');
DEFINE('_PN_OF','av');
DEFINE('_PN_START','Första');
DEFINE('_PN_PREVIOUS','Föregående');
DEFINE('_PN_NEXT','Nästa');
DEFINE('_PN_END','Sista');
DEFINE('_PN_DISPLAY_NR','Visa #');
DEFINE('_PN_RESULTS','Resultat');

/** emailfriend */
DEFINE('_EMAIL_TITLE','Tipsa en vän');
DEFINE('_EMAIL_FRIEND','Skicka den här sidan till en vän.');
DEFINE('_EMAIL_FRIEND_ADDR','Din väns e-postadress:');
DEFINE('_EMAIL_YOUR_NAME','Ditt namn:');
DEFINE('_EMAIL_YOUR_MAIL','Din e-postadress:');
DEFINE('_SUBJECT_PROMPT',' Ärende:');
DEFINE('_BUTTON_SUBMIT_MAIL','Skicka');
DEFINE('_BUTTON_CANCEL','Avbryt');
DEFINE('_EMAIL_ERR_NOINFO','Både din och din väns e-postadresser måste vara korrekt ifyllda.');
DEFINE('_EMAIL_MSG',' Den här sidan från "%s" har skickats till dig av %s ( %s ).

Du hittar sidan här: 
%s');
DEFINE('_EMAIL_INFO','Skickat av');
DEFINE('_EMAIL_SENT','Skickat till');
DEFINE('_PROMPT_CLOSE','Stäng fönstret');

/** classes/html/content.php */
DEFINE('_AUTHOR_BY', ' Bidrag från');
DEFINE('_WRITTEN_BY', ' Skrivet av');
DEFINE('_LAST_UPDATED', 'Senast uppdaterad');
DEFINE('_BACK','[ Tillbaka ]');
DEFINE('_LEGEND','Innehåll');
DEFINE('_DATE','Datum');
DEFINE('_ORDER_DROPDOWN','Sortering');
DEFINE('_HEADER_TITLE','Titel');
DEFINE('_HEADER_AUTHOR','Författare');
DEFINE('_HEADER_SUBMITTED','Skickad');
DEFINE('_HEADER_HITS','Träffar');
DEFINE('_E_EDIT','Ändra');
DEFINE('_E_ADD','Lägg till');
DEFINE('_E_WARNUSER','Välj Spara eller Avbryt');
DEFINE('_E_WARNTITLE','Artikeln måste ha en titel');
DEFINE('_E_WARNTEXT','Artikeln måste ha en ingress');
DEFINE('_E_WARNCAT','Ange kategori');
DEFINE('_E_CONTENT','Innehåll');
DEFINE('_E_TITLE','Titel:');
DEFINE('_E_CATEGORY','Kategori:');
DEFINE('_E_INTRO','Ingress');
DEFINE('_E_MAIN','Brödtext');
DEFINE('_E_MOSIMAGE','INSERT {mosimage}');
DEFINE('_E_IMAGES','Bilder');
DEFINE('_E_GALLERY_IMAGES','Galleribilder');
DEFINE('_E_CONTENT_IMAGES','Artikelbilder');
DEFINE('_E_EDIT_IMAGE','Ändra bild');
DEFINE('_E_NO_IMAGE','Ingen bild');
DEFINE('_E_INSERT','Infoga');
DEFINE('_E_UP','Upp');
DEFINE('_E_DOWN','Ner');
DEFINE('_E_REMOVE','Ta bort');
DEFINE('_E_SOURCE','Källa:');
DEFINE('_E_ALIGN','Justering:');
DEFINE('_E_ALT','Alternativ text:');
DEFINE('_E_BORDER','Ram:');
DEFINE('_E_CAPTION','Rubrik');
DEFINE('_E_CAPTION_POSITION','Rubrikposition');
DEFINE('_E_CAPTION_ALIGN','Rubrikanpassning');
DEFINE('_E_CAPTION_WIDTH','Rubrikbredd');
DEFINE('_E_APPLY','Godkänn');
DEFINE('_E_PUBLISHING','Publicering');
DEFINE('_E_STATE','Status:');
DEFINE('_E_AUTHOR_ALIAS','Författarens Alias:');
DEFINE('_E_ACCESS_LEVEL','Åtkomstnivå:');
DEFINE('_E_ORDERING','Sortering:');
DEFINE('_E_START_PUB','Starta publicering:');
DEFINE('_E_FINISH_PUB','Avsluta publicering:');
DEFINE('_E_SHOW_FP','Visa på förstasidan:');
DEFINE('_E_HIDE_TITLE','Dölj artikelns titel:');
DEFINE('_E_METADATA','Metadata');
DEFINE('_E_M_DESC','Beskrivning:');
DEFINE('_E_M_KEY','Nyckelord:');
DEFINE('_E_SUBJECT','Ärende:');
DEFINE('_E_EXPIRES','Utgångsdatum:');
DEFINE('_E_VERSION','Version:');
DEFINE('_E_ABOUT','Om');
DEFINE('_E_CREATED','Skapad:');
DEFINE('_E_LAST_MOD','Senast ändrad:');
DEFINE('_E_HITS','Träffar:');
DEFINE('_E_SAVE','Spara');
DEFINE('_E_CANCEL','Ångra');
DEFINE('_E_REGISTERED','Endast för registrerade användare');
DEFINE('_E_ITEM_INFO','Artikelinformation');
DEFINE('_E_ITEM_SAVED','Artikeln är sparad.');
DEFINE('_ITEM_PREVIOUS','&lt; Föregående');
DEFINE('_ITEM_NEXT','Nästa &gt;');
DEFINE('_KEY_NOT_FOUND','Hittade inte sökord');


/** content.php */
DEFINE('_SECTION_ARCHIVE_EMPTY','Det finns ingenting i det här arkivet just nu. Välkommen tillbaka senare.');
DEFINE('_CATEGORY_ARCHIVE_EMPTY','Det finns ingenting i det här arkivet just nu. Välkommen tillbaka senare.');
DEFINE('_HEADER_SECTION_ARCHIVE','Sektion - Arkiv');
DEFINE('_HEADER_CATEGORY_ARCHIVE','Kategori - Arkiv');
DEFINE('_ARCHIVE_SEARCH_FAILURE','Det finns inga arkiverade artiklar från %s %s');	// values are month then year
DEFINE('_ARCHIVE_SEARCH_SUCCESS','Här är de arkiverade artiklarna från %s %s');	// values are month then year
DEFINE('_FILTER','Filter');
DEFINE('_ORDER_DROPDOWN_DA','Datum stigande');
DEFINE('_ORDER_DROPDOWN_DD','Datum fallande');
DEFINE('_ORDER_DROPDOWN_TA','Titel stigande');
DEFINE('_ORDER_DROPDOWN_TD','Titel fallande');
DEFINE('_ORDER_DROPDOWN_HA','Träffar stigande');
DEFINE('_ORDER_DROPDOWN_HD','Träffar fallande');
DEFINE('_ORDER_DROPDOWN_AUA','Författare stigande');
DEFINE('_ORDER_DROPDOWN_AUD','Författare fallande');
DEFINE('_ORDER_DROPDOWN_O','Sortering');

/** poll.php */
DEFINE('_ALERT_ENABLED','Cookies måste vara aktiverade i din webbläsare!');
DEFINE('_ALREADY_VOTE','Du (eller någon annan som använder samma dator) har redan röstat en gång idag!');
DEFINE('_NO_SELECTION','Du har inte gjort något val, försök igen');
DEFINE('_THANKS','Tack för din röst!');
DEFINE('_SELECT_POLL','Välj fråga från listan');

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
DEFINE('_POLL_TITLE','Webbfråga - Resultat');
DEFINE('_SURVEY_TITLE','Webbfråga - Titel:');
DEFINE('_NUM_VOTERS','Antal röster');
DEFINE('_FIRST_VOTE','Första röst');
DEFINE('_LAST_VOTE','Senaste röst');
DEFINE('_SEL_POLL','Välj fråga:');
DEFINE('_NO_RESULTS','Det finns inga resultat för den här frågan.');

/** registration.php */
DEFINE('_ERROR_PASS','Tyvärr, hittar inte användaren.');
DEFINE('_NEWPASS_MSG','Användaren $checkusername har den här e-postadressen.\n'
.'En besökare från $mosConfig_live_site har just begärt ett nytt lösenord.\n\n'
.' Ditt nya lösenord är: $newpass\n\nOm du inte har begärt något nytt lösenord, finns ändå ingen anledning till oro.'
.' Det är bara du som kan se det här meddelandet, ingen annan. Om det här har blivit fel, logga bara in med det'
.' nya lösenordet, sedan kan du byta till ett nytt lösenord du själv vill ha.');
DEFINE('_NEWPASS_SUB','$_sitename :: Nytt lösenord för - $checkusername');
DEFINE('_NEWPASS_SENT','Nytt lösenord skapat och skickat!');
DEFINE('_REGWARN_NAME','Ange ditt namn.');
DEFINE('_REGWARN_UNAME','Ange ett användarnamn.');
DEFINE('_REGWARN_MAIL','Ange en giltig e-postadress.');
DEFINE('_REGWARN_PASS','Ange ett lösenord.  Lösenordet får inte innehålla mellanslag, ska vara minst 6 tecken långt och bestå av 0-9,a-z,A-Z');
DEFINE('_REGWARN_VPASS1','Bekräfta lösenordet.');
DEFINE('_REGWARN_VPASS2','Lösenordet och bekräftelsen stämmer inte, försök igen.');
DEFINE('_REGWARN_INUSE','Det här användarnamnet/lösenordet används redan. Försök med något annat.');
DEFINE('_REGWARN_EMAIL_INUSE', 'Den här e-postadressen är redan registrerad. Om du har glömt lösenordet, klicka på "Glömt ditt lösenord?" så kommer ett nytt lösenord att skickas till dig.');
DEFINE('_SEND_SUB','Kontouppgifter för %s at %s');
DEFINE('_USEND_MSG_ACTIVATE', 'Hej %s,

Tack för att du har registrerat dig på %s. Ditt konto är skapat och måste aktiveras innan du kan använda det.
För att aktivera kontot, klicka på nedanstående länk eller klipp och klistra in den i din webbläsare:
%s

Efter aktivering kan du logga in på %s med nedanstående användarnamn och lösenord:

Användarnamn - %s
Lösenord - %s');
DEFINE('_USEND_MSG', "Hej %s,

Tack för att du har registrerat dig på %s.

Du kan nu logga in på %s med det användarnamn och lösenord du registrerade dig med.");
DEFINE('_USEND_MSG_NOPASS','Hej $name,\n\nDu är nu upplagd som användare på $mosConfig_live_site.\n'
.'Du kan logga in på $mosConfig_live_site med det användarnamn och lösenord du angav när du registrerade dig.\n\n'
.'Svara inte på detta meddelande eftersom det är automatiskt genererat och kommer inte att läsas eller besvaras.\n');
DEFINE('_ASEND_MSG','Hej %s,

En ny användare har registrerat sig på %s.
Här är användaruppgifterna:

Namn - %s
E-post - %s
Användarnamn - %s

Svara inte på detta meddelande eftersom det är automatiskt genererat och kommer inte att läsas eller besvaras.');
DEFINE('_REG_COMPLETE_NOPASS','<div class="componentheading">Registreringen är klar!</div><br />&nbsp;&nbsp;'
.'Du kan logga in nu.<br />&nbsp;&nbsp;');
DEFINE('_REG_COMPLETE', '<div class="componentheading">Registrering klar!</div><br />Du kan logga in nu.');
DEFINE('_REG_COMPLETE_ACTIVATE', '<div class="componentheading">Registreringen är klar!</div><br />Ditt konto har skapats och en aktiveringslänk är skickad till den e-postadress du har angett. Glöm inte att du måste aktivera kontot genom att klicka på aktiveringslänken i meddelandet du får, innan du kan logga in.');
DEFINE('_REG_ACTIVATE_COMPLETE', '<div class="componentheading">Activation Complete!</div><br />Ditt konto har aktiverats så nu kan du logga in med det användarnamn och lösenord du har angett vid registreringen.');
DEFINE('_REG_ACTIVATE_NOT_FOUND', '<div class="componentheading">Ogiltig aktiveringslänk!</div><br />Kontot finns inte i vår databas eller så är kontot redan aktiverat.');

/** classes/html/registration.php */
DEFINE('_PROMPT_PASSWORD','Glömt ditt lösenord?');
DEFINE('_NEW_PASS_DESC','Ange användarnamn och e-postadress och klicka sedan på knappen Skicka lösenord.<br />'
.'Du kommer strax att få ett nytt lösenord.  Använd det nya lösenordet för att logga in.');
DEFINE('_PROMPT_UNAME','Användarnamn:');
DEFINE('_PROMPT_EMAIL','E-post:');
DEFINE('_BUTTON_SEND_PASS','Skicka lösenord');
DEFINE('_REGISTER_TITLE','Registrering');
DEFINE('_REGISTER_NAME','Namn:');
DEFINE('_REGISTER_UNAME','Användarnamn:');
DEFINE('_REGISTER_EMAIL','E-post:');
DEFINE('_REGISTER_PASS','Lösenord:');
DEFINE('_REGISTER_VPASS','Bekräfta lösenord:');
DEFINE('_REGISTER_REQUIRED','Fält markerade med en asterisk (*) är obligatoriska.');
DEFINE('_BUTTON_SEND_REG','Skicka registrering');
DEFINE('_SENDING_PASSWORD','Ditt lösenord skickas till e-postadressen du angivit.<br />När du har fått ditt'
.' nya lösenord kan du logga in och ändra det.');

/** classes/html/search.php */
DEFINE('_SEARCH_TITLE','Sök');
DEFINE('_PROMPT_KEYWORD','Nyckelord');
DEFINE('_SEARCH_MATCHES','Din sökning gav %d träffar');
DEFINE('_CONCLUSION','Totalt $totalRows träffar.  Sök [ <b>$searchword</b> ] med');
DEFINE('_NOKEYWORD','Inga sökträffar');
DEFINE('_IGNOREKEYWORD','Ett eller flera vanligt förekommande ord ignorerades i sökningen');
DEFINE('_SEARCH_ANYWORDS','Något ord');
DEFINE('_SEARCH_ALLWORDS','Alla ord');
DEFINE('_SEARCH_PHRASE','Exakt fras');
DEFINE('_SEARCH_NEWEST','Nyaste först');
DEFINE('_SEARCH_OLDEST','Äldsta först');
DEFINE('_SEARCH_POPULAR','Mest populära');
DEFINE('_SEARCH_ALPHABETICAL','Alfabetisk');
DEFINE('_SEARCH_CATEGORY','Sektion/Kategori');
DEFINE('_SEARCH_MESSAGE','Söksträngen skall innehålla minst 3 tecken och högst 20 tecken'); 
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
DEFINE('_SEARCH_BOX','Sök...');
DEFINE('_NEWSFLASH_BOX','Notiser!');
DEFINE('_MAINMENU_BOX','Huvudmeny');

/** classes/html/usermenu.php */
DEFINE('_UMENU_TITLE','Användarmeny');
DEFINE('_HI','Du är inloggad som ');

/** user.php */
DEFINE('_SAVE_ERR','Fyll i alla fält.');
DEFINE('_THANK_SUB','Tack för ditt bidrag. En administratör kommer att granska det innan det publiceras på webbplatsen.');
DEFINE('_THANK_SUB_PUB','Tack för ditt bidrag.');
DEFINE('_UP_SIZE','Du kan inte ladda upp filer som är större än 15kb.');
DEFINE('_UP_EXISTS','Bild $userfile_name finns redan. Döp om filen och försök igen.');
DEFINE('_UP_COPY_FAIL','Kunde inte kopiera');
DEFINE('_UP_TYPE_WARN','Du kan bara ladda upp gif- eller jpg-bilder.');
DEFINE('_MAIL_SUB','Ny användare');
DEFINE('_MAIL_MSG','Hej $adminName,\n\nen ny användare $type, $title, har lagts upp av $author'
.' till $mosConfig_live_site.\n'
.'Gå till $mosConfig_live_site/administrator för att kontrollera och godkänna $type.\n\n'
.'Svara inte på detta meddelande eftersom det är automatiskt genererat och kommer inte att läsas eller besvaras.\n');
DEFINE('_PASS_VERR1','Om du byter lösenord måste du bekräfta det nya lösenordet.');
DEFINE('_PASS_VERR2','Om du byter lösenord måste det nya lösenordet matcha bekräftelsen.');
DEFINE('_UNAME_INUSE','Användarnamnet finns redan.');	
DEFINE('_UPDATE','Uppdatera');
DEFINE('_USER_DETAILS_SAVE','Dina inställningar har sparats.');
DEFINE('_USER_LOGIN','Användarlogin');

/** components/com_user */
DEFINE('_EDIT_TITLE','Ändra dina uppgifter');
DEFINE('_YOUR_NAME','Namn:');
DEFINE('_EMAIL','E-post:');
DEFINE('_UNAME','Alias:');
DEFINE('_PASS','Lösenord:');
DEFINE('_VPASS','Bekräfta lösenord:');
DEFINE('_SUBMIT_SUCCESS','Skickat!');
DEFINE('_SUBMIT_SUCCESS_DESC','Ditt bidrag har nu skickats. Det kommer att kontrolleras innan det publiceras på webbplatsen.');
DEFINE('_WELCOME','Välkommen!');
DEFINE('_WELCOME_DESC','Välkommen till användarsektionen på vår webbplats');
DEFINE('_CONF_CHECKED_IN','Tidigare reserverade artiklar är nu tillgängliga');
DEFINE('_CHECK_TABLE','Kontrollerar lista');
DEFINE('_CHECKED_IN','Tillgängliga ');
DEFINE('_CHECKED_IN_ITEMS',' artiklar');
DEFINE('_PASS_MATCH','Lösenorden är inte lika');

/** components/com_banners */
DEFINE('_BNR_CLIENT_NAME','Du måste välja ett namn på klienten.');
DEFINE('_BNR_CONTACT','Du måste välja en kontaktperson för klienten.');
DEFINE('_BNR_VALID_EMAIL','Du måste välja en giltig e-postadress för klienten.');
DEFINE('_BNR_CLIENT','Du måste välja en klient,');
DEFINE('_BNR_NAME','Du måste välja ett namn för webbannonsen.');
DEFINE('_BNR_IMAGE','Du måste välja en bild för webbannonsen.');
DEFINE('_BNR_URL','Du måste välja en URL/anpassad kod för webbannonsen.');

/** components/com_login */
DEFINE('_ALREADY_LOGIN','Du har redan loggat in!');
DEFINE('_LOGOUT','Klicka här för att logga ut.');
DEFINE('_LOGIN_TEXT','Använd login- och lösenordsfälten bredvid för att behörighet till allt innehåll.');
DEFINE('_LOGIN_SUCCESS','Du är inloggad.');
DEFINE('_LOGOUT_SUCCESS','Du är utloggad.');
DEFINE('_LOGIN_DESCRIPTION','Var vänlig logga in för åtkomst av den privata delen av webbplatsen');
DEFINE('_LOGOUT_DESCRIPTION','Du är just nu inloggad på den privata delen av webbplatsen');

/** components/com_weblinks */
DEFINE('_WEBLINKS_TITLE','Länkar');
DEFINE('_WEBLINKS_DESC','Välj kategori i listan nedan. Klicka sedan på länken till sidan du vill besöka.');
DEFINE('_HEADER_TITLE_WEBLINKS','Länkar');
DEFINE('_SECTION','Sektion:');
DEFINE('_SUBMIT_LINK','Lägg till en länk');
DEFINE('_URL','Webbadress:');
DEFINE('_URL_DESC','Beskrivning:');
DEFINE('_NAME','Namn:');
DEFINE('_WEBLINK_EXIST','Det finns redan en länk med det namnet, försök igen.');
DEFINE('_WEBLINK_TITLE','Din länk måste ha en titel.');

/** components/com_newfeeds */
DEFINE('_FEED_NAME','Flödesnamn');
DEFINE('_FEED_ARTICLES','Antal artiklar');
DEFINE('_FEED_LINK','Flödeslänk');

/** whos_online.php */
DEFINE('_WE_HAVE', 'Vi har ');
DEFINE('_AND', ' och ');
DEFINE('_GUEST_COUNT','%s gäst');
DEFINE('_GUESTS_COUNT','%s gäster');
DEFINE('_MEMBER_COUNT','%s medlem');
DEFINE('_MEMBERS_COUNT','%s medlemmar');
DEFINE('_ONLINE',' online');
DEFINE('_NONE','Inga användare online');
/** modules/mod_random_image */
DEFINE('_NO_IMAGES','Inga bilder');

/** modules/mod_stats.php */
DEFINE('_TIME_STAT','Tid');
DEFINE('_MEMBERS_STAT','Medlemmar');
DEFINE('_HITS_STAT','Träffar');
DEFINE('_NEWS_STAT','Nyheter');
DEFINE('_LINKS_STAT','Länkar');
DEFINE('_VISITORS','Besökare');

/** /adminstrator/components/com_menus/admin.menus.html.php */
DEFINE('_MAINMENU_HOME','* Den första publicerade artikeln i den här menyn [huvudmeny] är standard `Startsida` för den här webbplatsen *');
DEFINE('_MAINMENU_DEL','* Du kan inte `radera` den här menyn eftersom den behövs för att Joomla! skall fungera korrekt *');
DEFINE('_MENU_GROUP','* En del `menytyper` finns i mer än en grupp *');


/** administrators/components/com_users */
DEFINE('_NEW_USER_MESSAGE_SUBJECT', 'Ny användare' );
DEFINE('_NEW_USER_MESSAGE', 'Hej %s,


Du har har lagts till som användare av %s av en administratör.

Detta meddelande innehåller ditt användarnamn och lösenord för att logga in på %s:

Användarnamn - %s
Lösenord - %s


Svara inte på detta meddelande eftersom det är automatiskt genererat och kommer inte att läsas eller besvaras.');

/** administrators/components/com_massmail */
DEFINE('_MASSMAIL_MESSAGE', "Det här är ett meddelande från '%s'

Meddelande:
" );

/** includes/pdf.php */ 
DEFINE('_PDF_GENERATED','Genererad:'); 
DEFINE('_PDF_POWERED','Powered by Joomla!'); 


?>