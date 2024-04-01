package cn.mju.wjh.chart.controller;

import cn.mju.wjh.chart.service.MedalService;
import cn.mju.wjh.common.core.utils.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * ClassName: MedalController
 * Package: cn.mju.wjh.chart.controller
 * Description: 勋章控制层
 *
 * @Author:wjh
 * @Create:2024-02-2024/2/16--15:23
 */
@RestController
@Tag(name = "勋章服务")
@RequestMapping("/front/medal/")
public class MedalController {

    @Setter(onMethod_ = @Autowired)
    private MedalService medalService;

    @GetMapping("getAllMedal")
    @Operation(summary = "获取所有勋章信息", description = "所有勋章信息")
    public Result getAllMedal() {
        return medalService.getAllMedal();
    }
}
