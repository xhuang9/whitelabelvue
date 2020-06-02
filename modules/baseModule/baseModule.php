<?php

namespace modules\baseModule;

use Craft;
use Yii;
use modules\baseModule\extensions\commonExtension;

/**
 * Custom module class.
 *
 * This class will be available throughout the system via:
 * `Craft::$app->getModule('my-module')`.
 *
 * You can change its module ID ("my-module") to something else from
 * config/app.php.
 *
 * If you want the module to get loaded on every request, uncomment this line
 * in config/app.php:
 *
 *     'bootstrap' => ['my-module']
 *
 * Learn more about Yii module development in Yii's documentation:
 * http://www.yiiframework.com/doc-2.0/guide-structure-modules.html
 */
class baseModule extends yii\base\Module {
    /**
     * Initializes the module.
     */
    public function init() {
        // Set a @modules alias pointed to the modules/ directory
        Craft::setAlias( '@modules', __DIR__ );

        // Set the controllerNamespace based on whether this is a console or web request
        if ( Craft::$app->getRequest()->getIsConsoleRequest() ) {
            $this->controllerNamespace = 'modules\\baseModule\\console\\controllers';
        } else {
            $this->controllerNamespace = 'modules\\baseModule\\controllers';
        }

        parent::init();

        //register some new Twig extension
        if ( Craft::$app->request->getIsSiteRequest() ) {
            // Add in our Twig extension
            $extension = new commonExtension();
            Craft::$app->view->registerTwigExtension( $extension );
        }

        $this->callEvents();
    }

    protected function callEvents(){


    }
}
