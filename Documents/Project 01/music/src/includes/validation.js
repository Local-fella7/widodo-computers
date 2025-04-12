import { Form as VeeForm, Field as VeeField, defineRule, ErrorMessage, configure } from "vee-validate";
import { required, email, min, max, alpha_spaces as alphaSpace, confirmed,between, min_value } from "@vee-validate/rules";

export default{
  install(app){
    app.component("VeeForm", VeeForm);
    app.component("VeeField", VeeField);
    app.component("ErrorMessage", ErrorMessage)

    defineRule('required', required)
    defineRule('email', email)
    defineRule('min', min)
    defineRule('max', max)
    defineRule('alpha_spaces', alphaSpace)
    defineRule('confirmed', confirmed)
    defineRule('between', between)
    defineRule('tos', value => {
      return value === true || "Accept the terms of Service";
    });
    configure({
        generateMessage: (ctx) => {
          const messages = {
            required: `This Field ${ctx.field} is required`,
            email: `This Field ${ctx.field} is invalid email`,
            min: `This Field ${ctx.field} is invalid min`,
            max: `This Field ${ctx.field} is invalid max`,
            alpha_spaces: `This Field ${ctx.field} is invalid alpha_spaces`,
            confirmed: `This Field ${ctx.field} is invalid confirmed`,
            between: `This Field ${ctx.field} must be ${ctx.rule.params[0]} and ${ctx.rule.params[1]} is invalid between`,
            min_value: `This Field ${ctx.field} must be ${ctx.rule.params.min} or more`,
            max_value: `This Field ${ctx.field} must be ${ctx.rule.params.max} or less`,
          }
          return messages[ctx.rule.name]
          ? messages [ctx.rule.name]:`This field ${ctx.field} is invalid`;
        },
        validateOnBlur: true,
        validateOnChange: true,
        validateOnInput: false,
        validateOnModelUpdate: true,

        })

  }
}