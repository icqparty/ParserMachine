FROM php:5

RUN yes | pecl install xdebug
RUN  echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.profiler_enable=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.profiler_enable_trigger=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.profiler_output_dir=/usr/src/profiler" >> /usr/local/etc/php/conf.d/xdebug.ini
#    && echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/xdebug.ini
RUN apt-get update && apt-get install -y git
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=bin

RUN echo "date.timezone = UTC" >> /usr/local/etc/php/conf.d/php.ini