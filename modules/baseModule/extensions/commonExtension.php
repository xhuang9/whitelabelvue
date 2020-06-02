<?php
/**
 * Created by PhpStorm.
 * User: Parry
 * Date: 30/08/2018
 * Time: 10:14 AM
 */

namespace modules\baseModule\extensions;

use Craft;
use craft\elements\Entry;
use craft\helpers\StringHelper;
//use nystudio107\seomatic\models\jsonld\DateTime;
use modules\baseModule\services\Helper;
use PHPHtmlParser\Dom;
use Twig\Extension\AbstractExtension as AbstractExtension;
use Twig\TwigFunction as TwigFunction;
use Twig\TwigFilter as TwigFilter;
use modules\baseModule\ToolBox\Log;
use modules\baseModule\component\Booking;

class commonExtension extends AbstractExtension{

    public function getFunctions()
    {
        return array(
            new TwigFunction('getParam', array($this, 'getParam')),
            new TwigFunction('stringReplace', array($this, 'stringReplace')),
            new TwigFunction('getDeviceIPAddress', array($this, 'getDeviceIPAddress')),
            new TwigFunction('explode', array($this, 'explode')),
            new TwigFunction('array_values', array($this, 'array_values')),
            new TwigFunction('php_die', array($this, 'php_die')),
            new TwigFunction('getDefaultUrl', array($this, 'getDefaultUrl')),
        );
    }


    public function getDefaultUrl(){
        return getenv('DEFAULT_SITE_URL')."/";
    }

    /**
     * This is using get method
     * Usage in twig {{ getParam("Param Name", $default) }}
     * Get post parameter, if not defined use the default value
     * @param $name
     * @param $default
     * @return mixed
     */
    public function getParam($name,$default){

        $r = (isset($_GET[$name])&&$_GET[$name]!="")?$_GET[$name]:$default;
        return $r;
    }

    /**
     * Usage in twig {{ stringReplace("a","A","apple") }}
     * output "Apple"
     * @param $search
     * @param $replace
     * @param $subject
     * @return mixed
     */
    public function stringReplace($search,$replace,$subject){
        return str_replace($search,$replace,$subject);
    }

    /**
     * Usage in twig {{ getDeviceIPAddress() }}
     * Output Ip Address
     * @return mixed
     */
    public function getDeviceIPAddress()
    {
        return $_SERVER['REMOTE_ADDR'];
    }

    /**
     * Using php die() to terminate part of script for testing
     * @param $message string
     * @return void
     */

    public function php_die($message=""){
        die($message);
    }

    public function getFilters()
    {
      return array(
        new TwigFilter('phone', array($this, 'phone')),
        new TwigFilter('shorten', array($this, 'shortenNumber')),
        new TwigFilter('Int', array($this, 'convertInt')),
        new TwigFilter('jsonDecode', array($this, 'jsonDecode')),
        new TwigFilter('arrayPush', array($this, 'arrayPush')),
        new TwigFilter('reKabab', array($this, 'reverseKababCase')),
        new TwigFilter('slugify', array($this, 'slugify')),
      );
    }

    /**
     * twig usage {{ "0123456789" | phone }}
     * output "(01) 2345 6789"
     * @param $phone
     * @return mixed
     */
    public function phone($phone){
        $phone = substr_replace($phone, " ", 6, 0);
        $phone = substr_replace($phone, " ", 2, 0);
        $phone = substr_replace($phone, ")", 2, 0);
        $phone = substr_replace($phone, "(", 0, 0);
        return $phone;
    }

    /**
     * Usage in twig {{ "1000000" | shorten }}
     * Output "1 M"
     * convert long numbers into K, Million, Billion units
     * @param $number
     * @return string
     */
    public function shortenNumber($number){
        if($number/1000>=1){
            $result = $number/1000;
            return $result." K";
        }elseif($number/1000000>=1){
            $result = $number/1000000;
            return $result." M";
        }elseif($number/1000000000>=1){
            $result = $number/1000000000;
            return $result." B";
        }else{
            return $number;
        }
    }

    /**
     * Usage in twig {{ "1000000" | Int }}
     * Force convert other value to number
     * @param $number
     * @return int
     */
    public function convertInt($number){
        return (int)$number;
    }

    /**
     * Usage in twig {{ explode("one,two,three","_")) }}
     * Output array(3) { [0]=> string(3) "one" [1]=> string(3) "two" [2]=> string(5) "three" }
     * explode string to array based on divider given
     * @param $string
     * @param $divider
     * @return array
     */
    public function explode($string, $divider){
        $array = explode($divider, $string);
        return $array;
    }

    /**
     * Usage in twig {{ json_string |jsonDecode }}
     * Output decode result
     * @param $string
     * @return mixed
     */
    public function jsonDecode($string){
        return json_decode($string);
    }

    /**
     *
     * @param $array
     * @param $value
     * @return array
     */
    public function arrayPush($array,$value){
        $array[]=$value;
        return $array;
    }

    /**
     * Using php ucwords function to reverse kabab case from twig
     *
     * @param string $str
     * @return string $str
     */
    public function reverseKababCase($str){
        return ucwords(str_replace("-"," ",$str));
    }

    public function slugify($str){
        return StringHelper::slugify($str);
    }

}
