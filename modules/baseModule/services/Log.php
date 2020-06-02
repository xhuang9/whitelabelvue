<?php
/**
 * Created by PhpStorm.
 * User: yuxingw
 * Date: 6/12/18
 * Time: 12:52 PM
 */

namespace modules\baseModule\services;

class Log
{
    static $ok = "ok";
    static $error = "error";
    static $warning = "warning";
    static $feed = "feed";
    static $db = "DB";

    static $APILog = "api";
    static $fastWayLog = "fastway";
    static $sherpaLog = "sherpa";
    static $APIKey = "apikeys";
    static $errorLog = "error";
    static $sherpaTokenLog = "sherpatokens";
    static $feedLog = "feed";
    static $ftpLog = "FTP";
    static $dbLog = "DB";
    static $salesLog = "sales";
    static $extension = ".log";

    static function log($message, $type, $filename)
    {
        self::createLogFolder(CRAFT_BASE_PATH."/modules/baseModule/log/");

        $filename = $filename . "_" . date("ym", time()) . self::$extension;
        $date = date("Y-m-d H:i:s", time());
        $message = "[$date] [$type] $message";

        error_log($message.PHP_EOL, 3, CRAFT_BASE_PATH."/modules/baseModule/log/$filename");
    }

    static function error_log($data)
    {
        self::createLogFolder(CRAFT_BASE_PATH."/modules/baseModule/log/");

        $filename = "log" . self::$extension;
        $filePath = CRAFT_BASE_PATH."/modules/baseModule/log/$filename";
        $date = date("Y-m-d H:i:s", time());

        if(is_array($data) || is_object($data) )
        {

            error_log("[$date] " . print_r($data, true) . PHP_EOL, 3, $filePath );
        }
        else
        {
            $array = json_decode($data);
            if(json_last_error() == JSON_ERROR_NONE)
            {
                error_log("[$date] " . print_r(json_encode($array, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE), true) . PHP_EOL, 3, $filePath);
            }
            else
            {
                error_log("[$date] " . print_r($data, true) . PHP_EOL, 3, $filePath);
            }
        }
    }

    static function createLogFolder($path)
    {
        if(!file_exists($path))
        {
            mkdir($path, 0755, true);
        }
    }
}
