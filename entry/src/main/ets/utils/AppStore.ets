import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';

/**
 * 用户首选项
 * 需要手动配置环境
 */
export class AppPreferences {
  // 初始化一个本地存储
  private static _dataPreferences: preferences.Preferences | null = null;

  static init(context: common.UIAbilityContext) {
    // 初始化首选项数据
    let options: preferences.Options = { name: 'myStore' };
    AppPreferences._dataPreferences = preferences.getPreferencesSync(context, options); // 初始化用户首选项数据
  }

  /**
   * 设置本地首选项存储
   * @param key
   * @param value
   */
  static setData(key: string, value: string) {
    AppPreferences._dataPreferences?.putSync(key, value)
    AppPreferences._dataPreferences?.flush((err) => {
      if (err) {
        console.log("本地首选项存储失败")
      }
    })
  }

  /**
   * 获取本地首选项存储内容
   * @param key
   * @returns
   */
  static getData(key: string) {
    return AppPreferences._dataPreferences?.getSync(key, "")
  }

  // 删除本地某个存储
  static delData(key: string) {
    return AppPreferences._dataPreferences?.deleteSync(key)
  }
}
