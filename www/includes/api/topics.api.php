<?php
/*
 * messages.api.php
 * 
 * Copyright (c) 2014 Andrew Jordan
 * 
 * Permission is hereby granted, free of charge, to any person obtaining 
 * a copy of this software and associated documentation files (the 
 * "Software"), to deal in the Software without restriction, including 
 * without limitation the rights to use, copy, modify, merge, publish, 
 * distribute, sublicense, and/or sell copies of the Software, and to 
 * permit persons to whom the Software is furnished to do so, subject to 
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be 
 * included in all copies or substantial portions of the Software. 
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

include "includes/Topic.class.php";

$action = $request[$class]['action'];

switch($action) {
    case "pollMessage":
        $required_fields = array(
            "action",
            "topic_id",
        );
        foreach ($request[$class] as $key => $value) {
            if (!in_array($key, $required_fields)) {
                $output = array("error" => "invalid JSON object");
            } else {
                $r_key = array_search($key, $required_fields);
                unset($required_fields[$r_key]);
            }
        }
        if (!is_numeric($request[$class]['topic_id'])) {
            $output = array("error" => "invalid JSON object");
        }
        elseif (count($required_fields) > 0) {
            $output = array("error" => "invalid JSON object");
        } else {
            try {
                include "includes/Parser.class.php";
                $parser = new Parser();
                $topic = new Topic($authUser, $parser, $request[$class]['topic_id']);
                $message = $topic->pollMessage();
                if (count($message) > 0) {
                    $smarty->assign("message_data", $message);
                    $smarty->assign("topic_id", $topic->getTopicId());
                    $output = array("message" => $smarty->fetch("ajax/message.tpl"));
                } else {
                    $output = array();
                }
            } catch (Exception $e) {
                $output = array("error" => "invalid JSON object");        
            }
        }
        break;
    default:
        $output = array("error" => "invalid JSON object");
}
