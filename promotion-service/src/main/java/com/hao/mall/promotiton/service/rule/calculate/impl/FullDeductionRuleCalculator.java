/**
 * @author lidihao
 * @Description:
 */

package com.hao.mall.promotiton.service.rule.calculate.impl;

import com.hao.mall.promotiton.service.dto.PromotionCalculateReqDto;
import com.hao.mall.promotiton.service.dto.PromotionRuleCalculateRespDto;
import com.hao.mall.promotiton.service.rule.calculate.PromotionRuleCalculator;
import org.springframework.stereotype.Service;

/**
 * 满减规则计算
 */
@Service
public class FullDeductionRuleCalculator implements PromotionRuleCalculator {


    /**
     * 当匹配多个规则时，计算最优的规则
     * 算法实现: 带记忆的递归算法
     * @param promotionCalculateReqDto
     * @return
     */
    @Override
    public PromotionRuleCalculateRespDto calculateRule(PromotionCalculateReqDto promotionCalculateReqDto) {
        return null;
    }
}
