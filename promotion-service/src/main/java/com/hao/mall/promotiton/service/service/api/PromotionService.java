/**
 * @author: lidihao
 * @Description:
 * @date: 2023/11/10
 */
package com.hao.mall.promotiton.service.service.api;

import com.hao.mall.promotiton.service.dto.PromotionCalculateReqDto;
import com.hao.mall.promotiton.service.dto.PromotionCalculateRespDto;
import org.apache.dubbo.config.annotation.DubboService;


public interface PromotionService {
    PromotionCalculateRespDto calculatePromotion(PromotionCalculateReqDto promotionCalculateReqDto);
}
