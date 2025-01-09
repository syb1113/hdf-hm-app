import { promptAction } from '@kit.ArkUI';

export class showToast {
  text: string

  constructor(text: string) {
    this.text = text
  }

  ShowToast() {
    promptAction.showToast({
      message: this.text,
      duration: 2000
    })
  }
}