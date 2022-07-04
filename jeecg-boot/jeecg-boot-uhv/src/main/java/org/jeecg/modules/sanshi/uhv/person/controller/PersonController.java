package org.jeecg.modules.sanshi.uhv.person.controller;

import org.jeecg.common.api.vo.Result;
import org.jeecg.modules.sanshi.uhv.person.pojo.person;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/person")
public class PersonController {
    @RequestMapping("/personInfo")
    public Result<person> getPersonInfo(){

        return Result.OK();
    }
}
