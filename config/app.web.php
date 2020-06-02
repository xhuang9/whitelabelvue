<?php
$config = [
  'modules' => [
    'base' =>\modules\baseModule\baseModule::class
  ],
  'bootstrap' => ['base']
];

return $config;
