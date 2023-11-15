/**
 * @author: lidihao
 * @Description:
 * @date: 2023/11/10
 */
package com.hao.mall.promotiton.service.rule.calculate;

import com.hao.mall.promotiton.service.dto.PromotionCalculateReqDto;
import com.hao.mall.promotiton.service.dto.PromotionRuleCalculateRespDto;

public interface PromotionRuleCalculator {



    PromotionRuleCalculateRespDto calculateRule(PromotionCalculateReqDto promotionCalculateReqDto);

}
