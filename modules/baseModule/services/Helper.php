<?php


namespace modules\baseModule\services;


use craft\base\Component;

class Helper extends Component
{

    /**
     * @param $date
     * @return string
     * @throws \Exception
     */
    public static function getNextDate($date){
        $date = new \DateTime($date);
        $date->modify('+1 day');
        return $date->format('Y-m-d');
    }

    /**
     * @return string
     * @throws \Exception
     */
    public static function getToday(){
        $date = new \DateTime('now');
        return $date->format('Y-m-d');
    }

    public static function getNextMonth(){
        $date = new \DateTime('+1 month');
        return $date->format('Y-m-d');
    }

    public static function formatDate($date){
        $date = new \DateTime($date);
        return $date->format('Y-m-d');
    }

    public static function formatDateForPeople($date){
        $date = new \DateTime($date);
        return $date->format('d M Y');
    }

    /**
     * @param $startDate
     * @param $endDate
     * @return mixed
     * @throws \Exception
     */
    public static function getDateBetween($startDate, $endDate){
        $startDate = new \DateTime($startDate);
        $endDate = new \DateTime($endDate);
        $difference = date_diff($endDate, $startDate);
        return $difference->days;
    }

}
