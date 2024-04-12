// ignore_for_file: non_constant_identifier_names

import 'package:bomjour/utils/app_constants/constant_strings.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      ConstantStrings.let_explore: ConstantStrings.let_explore,
      ConstantStrings.top_city: ConstantStrings.top_city,
      ConstantStrings.all_city_country: ConstantStrings.all_city_country,
      ConstantStrings.search_city_of: ConstantStrings.search_city_of,
      ConstantStrings.search_city: ConstantStrings.search_city,
      ConstantStrings.prefrence: ConstantStrings.prefrence,
      ConstantStrings.select_pref: ConstantStrings.select_pref,
      ConstantStrings.select_min_pref: ConstantStrings.select_min_pref,
      ConstantStrings.noRecordFound: ConstantStrings.noRecordFound,
      ConstantStrings.ByPreferences: ConstantStrings.ByPreferences,

      ConstantStrings.buy_send: ConstantStrings.buy_send,
      ConstantStrings.next: ConstantStrings.next,
      ConstantStrings.apple: ConstantStrings.apple,
      ConstantStrings.title1: ConstantStrings.title1,
      ConstantStrings.title2: ConstantStrings.title2,
      ConstantStrings.title3: ConstantStrings.title3,
      ConstantStrings.subTitle1: ConstantStrings.subTitle1,
      ConstantStrings.subTitle2: ConstantStrings.subTitle2,
      ConstantStrings.subTitle3: ConstantStrings.subTitle3,
      ConstantStrings.title_type: ConstantStrings.title_type,
      ConstantStrings.title_type1: ConstantStrings.title_type1,
      ConstantStrings.signup: ConstantStrings.signup,
      ConstantStrings.facebook: ConstantStrings.facebook,
      ConstantStrings.google: ConstantStrings.google,
      ConstantStrings.signIn: ConstantStrings.signIn,
      ConstantStrings.enter_email_mobile: ConstantStrings.enter_email_mobile,
      ConstantStrings.correct_email: ConstantStrings.correct_email,
      ConstantStrings.enter_pass: ConstantStrings.enter_pass,
      ConstantStrings.forget_password: ConstantStrings.forget_password,
      ConstantStrings.dont_have_account: ConstantStrings.dont_have_account,
      ConstantStrings.sign_Up: ConstantStrings.sign_Up,
      ConstantStrings.first_name: ConstantStrings.first_name,
      ConstantStrings.last_name: ConstantStrings.last_name,
      ConstantStrings.email: ConstantStrings.email,
      ConstantStrings.number: ConstantStrings.number,
      ConstantStrings.already_have_account:
          ConstantStrings.already_have_account,
      ConstantStrings.signin: ConstantStrings.signin,
      ConstantStrings.password_must_be_characters:
          ConstantStrings.password_must_be_characters,
      ConstantStrings.verification: ConstantStrings.verification,
      ConstantStrings.get_sms: ConstantStrings.get_sms,
      ConstantStrings.send_code: ConstantStrings.send_code,
      ConstantStrings.enter_code: ConstantStrings.enter_code,
      ConstantStrings.verify: ConstantStrings.verify,
      ConstantStrings.verify_otp: ConstantStrings.verify_otp,
      ConstantStrings.otp_send: ConstantStrings.otp_send,
      ConstantStrings.forget: ConstantStrings.forget,
      ConstantStrings.password: ConstantStrings.password,
      ConstantStrings.enter_register_email:
          ConstantStrings.enter_register_email,
      ConstantStrings.reset_pass: ConstantStrings.reset_pass,
      ConstantStrings.enter_your_email: ConstantStrings.enter_your_email,
      ConstantStrings.do_not_match: ConstantStrings.do_not_match,
      ConstantStrings.create_new_pass: ConstantStrings.create_new_pass,
      ConstantStrings.confirm_password: ConstantStrings.confirm_password,
      ConstantStrings.apple: ConstantStrings.apple,
      ConstantStrings.skip: ConstantStrings.skip,

      ConstantStrings.home: ConstantStrings.home,
      ConstantStrings.explore: ConstantStrings.explore,
      ConstantStrings.occasions: ConstantStrings.occasions,
      ConstantStrings.menu: ConstantStrings.menu,
      ConstantStrings.all_occ: ConstantStrings.all_occ,
      ConstantStrings.search_gift: ConstantStrings.search_gift,
      ConstantStrings.top_cat: ConstantStrings.top_cat,
      ConstantStrings.view_all: ConstantStrings.view_all,
      ConstantStrings.top_gift: ConstantStrings.top_gift,
      ConstantStrings.best_gift: ConstantStrings.best_gift,
      ConstantStrings.trend_occ: ConstantStrings.trend_occ,
      ConstantStrings.customize: ConstantStrings.customize,
      ConstantStrings.top_seller: ConstantStrings.top_seller,
      ConstantStrings.near_by: ConstantStrings.near_by,
      ConstantStrings.account_has_been: ConstantStrings.account_has_been,
      ConstantStrings.created_sucessfully: ConstantStrings.created_sucessfully,
      ConstantStrings.explores: ConstantStrings.explores,
      ConstantStrings.des: ConstantStrings.des,
      ConstantStrings.cancel: ConstantStrings.cancel,
      ConstantStrings.sale: ConstantStrings.sale,
      ConstantStrings.giftFor: ConstantStrings.giftFor,
      ConstantStrings.byLocation: ConstantStrings.byLocation,
      ConstantStrings.byOccasion: ConstantStrings.byOccasion,
      ConstantStrings.selectOccasion: ConstantStrings.selectOccasion,
      ConstantStrings.byDate: ConstantStrings.byDate,
      ConstantStrings.selectDate: ConstantStrings.selectDate,
      ConstantStrings.byBudget: ConstantStrings.byBudget,
      ConstantStrings.filters: ConstantStrings.filters,
      ConstantStrings.resultFor: ConstantStrings.resultFor,
      ConstantStrings.occasions_text: ConstantStrings.occasions_text,
      ConstantStrings.explore_for: ConstantStrings.explore_for,
      ConstantStrings.explore_occ: ConstantStrings.explore_occ,
      ConstantStrings.add_occ: ConstantStrings.add_occ,
      ConstantStrings.no_personal: ConstantStrings.no_personal,
      ConstantStrings.plan_suprise_des: ConstantStrings.plan_suprise_des,
      ConstantStrings.search_occ: ConstantStrings.search_occ,
      ConstantStrings.select: ConstantStrings.select,
      ConstantStrings.general: ConstantStrings.general,
      ConstantStrings.appear: ConstantStrings.appear,
      ConstantStrings.account: ConstantStrings.account,
      ConstantStrings.reward: ConstantStrings.reward,
      ConstantStrings.language: ConstantStrings.language,
      ConstantStrings.invite: ConstantStrings.invite,
      ConstantStrings.orderHis: ConstantStrings.orderHis,
      ConstantStrings.wishList: ConstantStrings.wishList,
      ConstantStrings.address: ConstantStrings.address,
      ConstantStrings.menues: ConstantStrings.menues,
      ConstantStrings.logout: ConstantStrings.logout,
      ConstantStrings.logout_confirmation_title:
          ConstantStrings.logout_confirmation_title,
      ConstantStrings.logout_confirmation_description:
          ConstantStrings.logout_confirmation_description,
      ConstantStrings.yes: ConstantStrings.yes,
      ConstantStrings.no: ConstantStrings.no,

      /// Profile View
      ConstantStrings.defaultModel: ConstantStrings.defaultModel,
      ConstantStrings.defTitle: ConstantStrings.defTitle,
      ConstantStrings.lightMode: ConstantStrings.lightMode,
      ConstantStrings.lightTitle: ConstantStrings.lightTitle,
      ConstantStrings.darkMode: ConstantStrings.darkMode,
      ConstantStrings.darkTitle: ConstantStrings.darkTitle,
      ConstantStrings.myRewards: ConstantStrings.myRewards,
      ConstantStrings.wallet: ConstantStrings.wallet,
      ConstantStrings.rewards: ConstantStrings.rewards,
      ConstantStrings.Points: ConstantStrings.Points,
      ConstantStrings.all: ConstantStrings.all,
      ConstantStrings.earned: ConstantStrings.earned,
      ConstantStrings.Redeemed: ConstantStrings.Redeemed,
      ConstantStrings.english: ConstantStrings.english,
      ConstantStrings.engTitle: ConstantStrings.engTitle,
      ConstantStrings.arabic: ConstantStrings.arabic,
      ConstantStrings.arabicTitle: ConstantStrings.arabicTitle,
      ConstantStrings.myWish: ConstantStrings.myWish,
      ConstantStrings.newWishlist: ConstantStrings.newWishlist,
      ConstantStrings.public: ConstantStrings.public,
      ConstantStrings.birthday: ConstantStrings.birthday,
      ConstantStrings.shareLink: ConstantStrings.shareLink,
      ConstantStrings.addFriend: ConstantStrings.addFriend,
      ConstantStrings.peopleJoined: ConstantStrings.peopleJoined,
      ConstantStrings.Addresses: ConstantStrings.Addresses,
      ConstantStrings.addNew: ConstantStrings.addNew,
      ConstantStrings.addNewAddress: ConstantStrings.addNewAddress,
      ConstantStrings.Add: ConstantStrings.Add,
      ConstantStrings.Save: ConstantStrings.Save,
      ConstantStrings.Address: ConstantStrings.address,
      ConstantStrings.city: ConstantStrings.city,
      ConstantStrings.floor: ConstantStrings.floor,
      ConstantStrings.Home: ConstantStrings.Home,
      ConstantStrings.Office: ConstantStrings.Office,
      ConstantStrings.Appartment: ConstantStrings.Appartment,
      ConstantStrings.Villa: ConstantStrings.Villa,
      ConstantStrings.Other: ConstantStrings.Other,
      ConstantStrings.onHold: ConstantStrings.onHold,
      ConstantStrings.Cancelled: ConstantStrings.Cancelled,
      ConstantStrings.delivered: ConstantStrings.delivered,
      ConstantStrings.OrderDetails: ConstantStrings.OrderDetails,
      ConstantStrings.itemSummary: ConstantStrings.itemSummary,
      ConstantStrings.addTrack: ConstantStrings.addTrack,
      ConstantStrings.Payment: ConstantStrings.Payment,
      ConstantStrings.Summary: ConstantStrings.Summary,
      ConstantStrings.SubTotalProducts: ConstantStrings.SubTotalProducts,
      ConstantStrings.DeliveryFee: ConstantStrings.DeliveryFee,
      ConstantStrings.Tax: ConstantStrings.Tax,
      ConstantStrings.Total: ConstantStrings.Total,
      ConstantStrings.OR: ConstantStrings.OR,
      ConstantStrings.ShareLink: ConstantStrings.ShareLink,
      ConstantStrings.reviewCreate: ConstantStrings.reviewCreate,
      ConstantStrings.overAll: ConstantStrings.overAll,
      ConstantStrings.addHeading: ConstantStrings.addHeading,
      ConstantStrings.addPic: ConstantStrings.addPic,
      ConstantStrings.dislike: ConstantStrings.dislike,
      ConstantStrings.addWritten: ConstantStrings.addWritten,
      ConstantStrings.Next: ConstantStrings.Next,
      ConstantStrings.update: ConstantStrings.update,
      ConstantStrings.AddToCart: ConstantStrings.AddToCart,
      ConstantStrings.delete: ConstantStrings.delete,
      ConstantStrings.newPassCreated: ConstantStrings.newPassCreated,
      ConstantStrings.passDes: ConstantStrings.passDes,
      ConstantStrings.password_week: ConstantStrings.password_week,
      ConstantStrings.number_not_correct: ConstantStrings.number_not_correct,
      ConstantStrings.AvailableWraps: ConstantStrings.AvailableWraps,
      ConstantStrings.seeAll: ConstantStrings.seeAll,
      ConstantStrings.productDetail: ConstantStrings.productDetail,
      ConstantStrings.AddToOccasion: ConstantStrings.AddToOccasion,
      ConstantStrings.SelectWrap: ConstantStrings.SelectWrap,
      ConstantStrings.AddWrap: ConstantStrings.AddWrap,
      ConstantStrings.searchWrap: ConstantStrings.searchWrap,
      ConstantStrings.Categories: ConstantStrings.Categories,
      ConstantStrings.PreferenceBased: ConstantStrings.PreferenceBased,



      ConstantStrings.yourCart: ConstantStrings.yourCart,
      ConstantStrings.itemInCart: ConstantStrings.itemInCart,
      ConstantStrings.addItem: ConstantStrings.addItem,
      ConstantStrings.wishlist: ConstantStrings.wishlist,
      ConstantStrings.paymentCard: ConstantStrings.paymentCard,
      ConstantStrings.addNewCard: ConstantStrings.addNewCard,
      ConstantStrings.shareLinkAddress: ConstantStrings.shareLinkAddress,
      ConstantStrings.masterCard: ConstantStrings.masterCard,
      ConstantStrings.VisaCard: ConstantStrings.VisaCard,
      ConstantStrings.cart: ConstantStrings.cart,
      ConstantStrings.items: ConstantStrings.items,
      ConstantStrings.subTotal: ConstantStrings.subTotal,
      ConstantStrings.deliveryFee: ConstantStrings.deliveryFee,
      ConstantStrings.total: ConstantStrings.total,
      ConstantStrings.thankYou: ConstantStrings.thankYou,
      ConstantStrings.confirmOrder: ConstantStrings.confirmOrder,
      ConstantStrings.trackOrder: ConstantStrings.trackOrder,
      ConstantStrings.ContinueShopping: ConstantStrings.ContinueShopping,
      ConstantStrings.checkout: ConstantStrings.checkout,
      ConstantStrings.CartTotal: ConstantStrings.CartTotal,
      ConstantStrings.addToCart: ConstantStrings.addToCart,
      ConstantStrings.boughtTogether: ConstantStrings.boughtTogether,
      ConstantStrings.buyItemTogether: ConstantStrings.buyItemTogether,
      ConstantStrings.weReceived: ConstantStrings.weReceived,
      ConstantStrings.OrderSummary: ConstantStrings.OrderSummary,
      ConstantStrings.price: ConstantStrings.price,
      ConstantStrings.Taxes: ConstantStrings.Taxes,
      ConstantStrings.Delivery: ConstantStrings.Delivery,


      ConstantStrings.BackToHome: ConstantStrings.BackToHome,
      ConstantStrings.OrderStatus: ConstantStrings.OrderStatus,
      ConstantStrings.Date: ConstantStrings.Date,
      ConstantStrings.orderPlaced: ConstantStrings.orderPlaced,



      ///explore
      ConstantStrings.search_events: ConstantStrings.search_events,
      ConstantStrings.recommended: ConstantStrings.recommended,
      ConstantStrings.add_to_my_occasion: ConstantStrings.add_to_my_occasion,
      ConstantStrings.people: ConstantStrings.people,
      ConstantStrings.description: ConstantStrings.description,
      ConstantStrings.Activities: ConstantStrings.Activities,
      ConstantStrings.bookmarked_occasion: ConstantStrings.bookmarked_occasion,

/// add ocaasion
      ConstantStrings.select_option: ConstantStrings.select_option,
      ConstantStrings.add_event: ConstantStrings.add_event,
      ConstantStrings.create_group: ConstantStrings.create_group,
      ConstantStrings.Occasion: ConstantStrings.Occasion,
      ConstantStrings.occasion_for: ConstantStrings.occasion_for,
      ConstantStrings.relationship: ConstantStrings.relationship,
      ConstantStrings.date: ConstantStrings.date,
      ConstantStrings.add_friends_or_groups: ConstantStrings.add_friends_or_groups,
      ConstantStrings.make_occasion: ConstantStrings.make_occasion,
      ConstantStrings.occasion_preferences: ConstantStrings.occasion_preferences,
      ConstantStrings.creditsOffer: ConstantStrings.creditsOffer,

      ////occasionsView
      ConstantStrings.events: ConstantStrings.events,
      ConstantStrings.this_year: ConstantStrings.this_year,
      ConstantStrings.this_month: ConstantStrings.this_month,
      ConstantStrings.date_selection: ConstantStrings.date_selection,
      ConstantStrings.choose_an_occasion: ConstantStrings.choose_an_occasion,
      ConstantStrings.popular_occasion: ConstantStrings.popular_occasion,
      ConstantStrings.add_contact: ConstantStrings.add_contact,
      ConstantStrings.Gifts_for: ConstantStrings.Gifts_for,
      ConstantStrings.add_your_gift: ConstantStrings.add_your_gift,
      ConstantStrings.Memories: ConstantStrings.Memories,
      ConstantStrings.Memory: ConstantStrings.Memory,
      ConstantStrings.View_All_Memories: ConstantStrings.View_All_Memories,
      ConstantStrings.how_the_day_looking: ConstantStrings.how_the_day_looking,
      ConstantStrings.select_time_slot: ConstantStrings.select_time_slot,
      ConstantStrings.Add_Activity: ConstantStrings.Add_Activity,
      ConstantStrings.Activity_Name: ConstantStrings.Activity_Name,
      ConstantStrings.Activity_Loc: ConstantStrings.Activity_Loc,
      ConstantStrings.Recommended_Activities: ConstantStrings.Recommended_Activities,
      ConstantStrings.People_Attending: ConstantStrings.People_Attending,
      ConstantStrings.this_week: ConstantStrings.this_week,
      ConstantStrings.search_name: ConstantStrings.search_name,
      ConstantStrings.search_relation: ConstantStrings.search_relation,
      ConstantStrings.special_characters: ConstantStrings.special_characters,
      ConstantStrings.invitation_member: ConstantStrings.invitation_member,
      ConstantStrings.Added: ConstantStrings.Added,
      ConstantStrings.group_name: ConstantStrings.group_name,
      ConstantStrings.create_groups: ConstantStrings.create_groups,


    },
    'ar': {

      ConstantStrings.BackToHome: "العودة إلى الصفحة الرئيسية",
      ConstantStrings.OrderStatus: "حالة الطلب",
      ConstantStrings.Date: "التاريخ",
      ConstantStrings.orderPlaced: "تم وضع الطلب",
      ConstantStrings.Taxes: "الضرائب",
      ConstantStrings.Delivery: "التوصيل",
      ConstantStrings.price: "السعر",
      ConstantStrings.OrderSummary: "ملخص الطلبية",
      ConstantStrings.PreferenceBased: "على أساس التفضيل",
      ConstantStrings.ByPreferences: "هدية ل",
      ConstantStrings.yourCart: "عربة التسوق الخاصة بك",
      ConstantStrings.itemInCart: "منتج في عربة التسوق",
      ConstantStrings.addItem: "أضف عناصر من قائمة الرغبات",
      ConstantStrings.creditsOffer: "الاعتمادات والعروض",
      ConstantStrings.wishlist: "الخاصة بك.",
      ConstantStrings.paymentCard: "بطاقة الدفع",
      ConstantStrings.addNewCard: "إضافة بطاقة جديدة",
      ConstantStrings.shareLinkAddress: "مشاركة الرابط لإدخال العنوان",
      ConstantStrings.masterCard:"بطاقة الماستر",
      ConstantStrings.VisaCard: "بطاقة فيزا",
      ConstantStrings.cart: "عربة التسوق",
      ConstantStrings.items: ConstantStrings.items,
      ConstantStrings.subTotal: "المجموع الفرعي",
      ConstantStrings.deliveryFee:"رسوم التوصيل",
      ConstantStrings.total: "المجموع",
      ConstantStrings.thankYou: "شكرًا لك",
      ConstantStrings.confirmOrder: "تأكيد الطلب",
      ConstantStrings.trackOrder: "تعقب الطلبية",
      ConstantStrings.ContinueShopping:"استمر في التسوق",
      ConstantStrings.checkout: "تسجيل الخروج",
      ConstantStrings.CartTotal:"إجمالي عربة التسوق",
      ConstantStrings.addToCart: "تمت الإضافة إلى عربة التسوق",
      ConstantStrings.boughtTogether: "يتم شراؤها معًا بشكل متكرر",
      ConstantStrings.buyItemTogether: "اشتري قطعتين معًا",
      ConstantStrings.weReceived: "لقد استلمنا الدفعة وأرسلنا طلبك.",




      ConstantStrings.AvailableWraps: 'الأغطية المتاحة',
      ConstantStrings.seeAll: 'اظهار الكل',
      ConstantStrings.productDetail: 'تفاصيل المنتج',
      ConstantStrings.AddToOccasion: 'أضف إلى المناسبة',
      ConstantStrings.SelectWrap: 'أضف التفاف',
      ConstantStrings.AddWrap: 'أضف التفاف',
      ConstantStrings.searchWrap: 'التفاف البحث',
      ConstantStrings.password_week: 'كلمة المرور الخاصة بك هي أسبوع',
      ConstantStrings.number_not_correct: 'رقمك غير صحيح',
      ConstantStrings.let_explore: 'دعنا نستكشف',
      ConstantStrings.update: 'تحديث',
      ConstantStrings.buy_send: 'شراء أو إرسال هدية إلى',
      ConstantStrings.top_city: 'أهم المدن',
      ConstantStrings.all_city_country: 'جميع البلدان / المدن',
      ConstantStrings.search_city: 'مدينة البحث',
      ConstantStrings.prefrence: 'التفضيلات',
      ConstantStrings.select_pref: 'حدد التفضيلات',
      ConstantStrings.select_min_pref: 'الرجاء تحديد 5 تفضيلات على الأقل',
      ConstantStrings.noRecordFound: 'لا يوجد سجلات',
      ConstantStrings.skip: 'يتخطى',
      ConstantStrings.yes: 'نعم',
      ConstantStrings.no: 'لا',
      ConstantStrings.Categories: 'فئات',

      ConstantStrings.search_city_of: 'اختر مدينة',
      ConstantStrings.next: 'التالي',
      ConstantStrings.title1: 'مرحباً الى بومجور',
      ConstantStrings.title2: 'اكتشف ما هو يحدث حولها',
      ConstantStrings.title3: 'إنشاء مناسبات لا تنسى',
      ConstantStrings.subTitle1:
          'اكتشف طريقة جديدة للاحتفال باللحظات مع أحبائك. إرسال الهدايا وخلق الفرح دون عناء.',
      ConstantStrings.subTitle2:
          'تواصل مع مجتمعك. استكشف المهرجانات وورش العمل القريبة وغير ذلك الكثير، كل ذلك في متناول يدك.',
      ConstantStrings.subTitle3:
          'التخطيط لاحتفالات مفاجئة. تعاون في الهدايا وشارك الرسائل واجعل أي مسافة أقرب.',
      ConstantStrings.title_type: 'اطلب الهدايا عبر',
      ConstantStrings.title_type1: 'الإنترنت بدون متاعب',
      ConstantStrings.signup: 'اشتراك',
      ConstantStrings.facebook: 'تواصل مع الفيسبوك',
      ConstantStrings.google: 'تواصل مع جوجل',
      ConstantStrings.apple: 'تواصل مع أبل',
      ConstantStrings.signIn: 'تسجيل الدخول',
      ConstantStrings.signin: 'تسجيل الدخول',
      ConstantStrings.enter_email_mobile: 'أدخل البريد الإلكتروني أو الجوال',
      ConstantStrings.enter_pass: 'أدخل كلمة المرور',
      ConstantStrings.forget_password: 'هل نسيت كلمة السر',
      ConstantStrings.dont_have_account: 'ليس لديك حساب؟',
      ConstantStrings.correct_email: 'أدخل البريد الإلكتروني الصحيح',
      ConstantStrings.sign_Up: 'اشتراك',
      ConstantStrings.first_name: 'الاسم الأول',
      ConstantStrings.last_name: 'اسم العائلة',
      ConstantStrings.number: 'رقم الهاتف المحمول',
      ConstantStrings.email: 'أدخل البريد الإلكتروني',
      ConstantStrings.already_have_account: 'هل لديك حساب؟',
      ConstantStrings.password_must_be_characters:
          'يجب أن تتكون كلمة المرور من ٨ أحرف على الأقل',
      ConstantStrings.verification: 'تَحَقّق',
      ConstantStrings.enter_code: 'يرجى إدخال',
      ConstantStrings.send_code: ' أعد الإرسال',
      ConstantStrings.verify_otp: 'التحقق من كلمة المرور لمرة واحدة',
      ConstantStrings.verify: 'الرمز لتحقق من حسابك.',
      ConstantStrings.get_sms: 'لم تصل والرسائل النصية القصيرة؟',
      ConstantStrings.otp_send: 'لقد تم إرسال كلمة المرور لمرة واحدة (OTP) إلى',
      ConstantStrings.forget: 'نسيت',
      ConstantStrings.password: ' كلمة المرور؟',
      ConstantStrings.enter_your_email: 'أدخل بريدك الإلكتروني',
      ConstantStrings.enter_register_email:
          'أدخل بريدك الإلكتروني المسجل حتى نتمكن من إعادة تعيين كلمة المرور الخاصة بك.',
      ConstantStrings.reset_pass: 'إعادة تعيين كلمة المرور',
      ConstantStrings.create_new_pass:
          'قم بإنشاء كلمة المرور الجديدة الخاصة بك لبومجور واستكشف الآلاف من القوائم!',
      ConstantStrings.confirm_password: 'تأكيد كلمة المرور',
      ConstantStrings.do_not_match: 'لا تطابق كلمة المرور',
      ConstantStrings.home: 'بيت',
      ConstantStrings.explore: 'مناسبات',
      ConstantStrings.menu: 'يستكشف',
      ConstantStrings.occasions: 'قائمة طعام',
      ConstantStrings.all_occ: 'جميع المناسبات',
      ConstantStrings.search_gift: 'ابحث عن هدية',
      ConstantStrings.top_cat: 'أهم الفئات',
      ConstantStrings.view_all: 'عرض الكل',
      ConstantStrings.top_gift: 'أفضل الهدايا',
      ConstantStrings.best_gift: 'أفضل الهدايا ل',
      ConstantStrings.trend_occ: 'المناسبة الشائعة',
      ConstantStrings.customize: 'حسب الطلب',
      ConstantStrings.top_seller: 'أفضل البائعين',
      ConstantStrings.near_by: 'بالقرب من محلات بيع الهدايا',
      ConstantStrings.account_has_been: 'تم إنشاء',
      ConstantStrings.created_sucessfully: ' الحساب بنجاح!',
      ConstantStrings.des:
          'يمكنك الآن تسجيل الدخول باستخدام حسابك الذي تم إنشاؤه حديثًا. دعنا نستكشف تجربة الإهداء الإلكتروني من المستوى التالي.',
      ConstantStrings.explores: 'يستكشف',
      ConstantStrings.cancel: 'يلغي',
      ConstantStrings.resultFor: ' نتيجة لـ ',
      ConstantStrings.filters: 'المرشحات',
      ConstantStrings.giftFor: 'هدية ل',
      ConstantStrings.byLocation: 'حسب الموقع',
      ConstantStrings.byOccasion: 'حسب المناسبة',
      ConstantStrings.selectOccasion: 'حدد المناسبة',
      ConstantStrings.byDate: 'حدد المناسبة',
      ConstantStrings.selectDate: 'حدد تاريخ',
      ConstantStrings.byBudget: 'بالميزانية',
      ConstantStrings.occasions_text: 'مناسبات',
      ConstantStrings.explore_occ: 'استكشاف ل',
      ConstantStrings.explore_for: 'استكشاف ل',
      ConstantStrings.no_personal: 'لا توجد مناسبات شخصية',
      ConstantStrings.add_occ: 'أضف مناسبات',
      ConstantStrings.select: 'حدد',
      ConstantStrings.plan_suprise_des:
          'خطط لاحتفالات مفاجئة واجعل أي مسافة أقرب.',
      ConstantStrings.search_occ: 'مناسبة البحث',

      ConstantStrings.general: 'إعدادات عامة',
      ConstantStrings.account: 'الحساب',
      ConstantStrings.appear: 'المظهر',
      ConstantStrings.reward: 'نقاط المكافآت',
      ConstantStrings.language: 'اللغة',
      ConstantStrings.invite: 'ادعُ الأصدقاء',
      ConstantStrings.orderHis: 'سجل الطلبات',
      ConstantStrings.wishList: 'مجموعة قائمة الأمنيات',
      ConstantStrings.address: 'عناوين',
      ConstantStrings.menues: 'قائمة طعام',
      ConstantStrings.logout: 'الخروج',
      ConstantStrings.logout_confirmation_title: 'تأكيد',
      ConstantStrings.logout_confirmation_description:
          'هل أنت متأكد أنك تريد تسجيل الخروج؟',

      /// profileViews
      ConstantStrings.defaultModel: 'الوضع الافتراضي',
      ConstantStrings.defTitle: 'وضع واجهة المستخدم الافتراضي للنظام',
      ConstantStrings.lightMode: 'وضع الإضاءة',
      ConstantStrings.lightTitle:
          'وضع واجهة المستخدم الخفيفة (الألوان الزاهية)',
      ConstantStrings.darkMode: 'وضع الظلام',
      ConstantStrings.darkTitle: 'وضع واجهة المستخدم الداكن: ألوان ناعمة',
      ConstantStrings.myRewards: 'ملكي',
      ConstantStrings.wallet: 'المحفظة',
      ConstantStrings.rewards: 'المكافآت',
      ConstantStrings.Points: 'نقطة',
      ConstantStrings.all: 'جميع',
      ConstantStrings.earned: 'تم الحصول عليها',
      ConstantStrings.Redeemed: 'تم استردادها',
      ConstantStrings.english: 'الإنجليزية',
      ConstantStrings.engTitle: 'حدد اللغة الإنجليزية',
      ConstantStrings.arabic: 'العربية',
      ConstantStrings.arabicTitle: 'حدد اللغة العربية',
      ConstantStrings.myWish: 'قائمة أمنياتي',
      ConstantStrings.newWishlist: 'قائمة أمنيات جديدة',
      ConstantStrings.public: 'الجمهور',
      ConstantStrings.birthday: 'عيد ميلاد',
      ConstantStrings.shareLink: 'شارك الرابط',
      ConstantStrings.addFriend: 'إضافة أصدقاء',
      ConstantStrings.peopleJoined: 'شخص انضموا إلى قائمة الأمنيات هذه',
      ConstantStrings.Addresses: 'عناوين',
      ConstantStrings.addNew: 'إضافة جديد',
      ConstantStrings.addNewAddress: 'إضافة عنوان جديد',
      ConstantStrings.Add: 'أضِف',
      ConstantStrings.Save: 'وفر',
      ConstantStrings.Address: 'العنوان',
      ConstantStrings.city: 'المدينة',
      ConstantStrings.floor: 'الطابق',
      ConstantStrings.Home: 'فيلا',
      ConstantStrings.Office: 'شقة',
      ConstantStrings.Appartment: 'منصب',
      ConstantStrings.Villa: 'الصفحة الرئيسية',
      ConstantStrings.Other: 'أخرى',
      ConstantStrings.onHold: 'قيد الانتظار',
      ConstantStrings.Cancelled: 'أُلغيت',
      ConstantStrings.delivered: 'تم التوصيل',
      ConstantStrings.OrderDetails: 'سجل الطلبات',
      ConstantStrings.itemSummary: 'ملخص العنصر',
      ConstantStrings.addTrack: 'العنوان والتتبع',
      ConstantStrings.Payment: 'الدفع',
      ConstantStrings.Summary: 'ملخص',
      ConstantStrings.SubTotalProducts: 'منتجات المجموع الفرعي',
      ConstantStrings.DeliveryFee: 'رسوم التوصيل',
      ConstantStrings.Tax: 'ضريبة',
      ConstantStrings.Total: 'المجموع',
      ConstantStrings.OR: 'أو',
      ConstantStrings.ShareLink: 'مشاركة الرابط لإضافة موقع',
      ConstantStrings.reviewCreate: 'قم بإنشاء مراجعتك',
      ConstantStrings.overAll: 'التصنيف العام',
      ConstantStrings.addHeading: 'إضافة عنوان',
      ConstantStrings.addPic: 'إضافة صور',
      ConstantStrings.dislike: 'إضافة مراجعة مكتوبة',
      ConstantStrings.addWritten: 'ما الذي أعجبك أو لم يعجبك؟',
      ConstantStrings.Next: 'التالي',
      ConstantStrings.AddToCart: 'أضف إلى عربة التسوق',
      ConstantStrings.delete: 'حذف',
      ConstantStrings.newPassCreated: 'تم إنشاء كلمة مرور جديدة!',
      ConstantStrings.passDes:
          'يمكنك الآن تسجيل الدخول باستخدام كلمة مرور حسابك الذي تم إنشاؤه حديثًا. دعنا نستكشف تجربة الإهداء الإلكتروني من المستوى التالي.'
,
      ConstantStrings.search_events:"ابحث عن الأحداث",
      ConstantStrings.recommended: "يوصى به",
      ConstantStrings.add_to_my_occasion: "أضف إلى المناسبة الخاصة بي",
      ConstantStrings.people: "أشخاص",
      ConstantStrings.description: "وصف",
      ConstantStrings.Activities: "الأنشطة",
      ConstantStrings.bookmarked_occasion: "مناسبة مرجعية",


      ConstantStrings.select_option: "حدد الخيار",
      ConstantStrings.add_event: "أضف حدثًا",
      ConstantStrings.create_group: "إنشاء مجموعة",


      ConstantStrings.Occasion: "مناسبة",
      ConstantStrings.occasion_for: "مناسبة لـ",
      ConstantStrings.relationship: "علاقة",
      ConstantStrings.date: "التاريخ",
      ConstantStrings.add_friends_or_groups: "إضافة أصدقاء أو مجموعات",
      ConstantStrings.occasion_preferences: "تفضيلات المناسبة",
      ConstantStrings.make_occasion: "اصنع مناسبة",



      ConstantStrings.events: "الأحداث",
      ConstantStrings.this_year:"هذا العام",
      ConstantStrings.this_month: "هذا الشهر",
      ConstantStrings.this_week: "هذا الاسبوع",
      ConstantStrings.date_selection: "اختيار التاريخ المخصص",
      ConstantStrings.choose_an_occasion: "اختر مناسبة",
      ConstantStrings.popular_occasion: "مناسبات شعبية",
      ConstantStrings.add_contact: "إضافة جهة اتصال",
      ConstantStrings.Gifts_for: "هدايا لإ",
      ConstantStrings.add_your_gift: " أضف هديتك",
      ConstantStrings.Memories: "ذكريات",
      ConstantStrings.Memory: "ذاكرة",
      ConstantStrings.View_All_Memories: "عرض جميع الذكريات",
      ConstantStrings.how_the_day_looking: "كيف يبدو اليوم؟",
      ConstantStrings.select_time_slot: "حدد فترة زمنية لإضافة نشاط",
      ConstantStrings.Add_Activity: 'إضافة نشاط',
      ConstantStrings.Activity_Name: "اسم النشاط",
      ConstantStrings.Activity_Loc: "موقع النشاط",
      ConstantStrings.Recommended_Activities: "الأنشطة الموصى بها ",
      ConstantStrings.People_Attending: "الأشخاص الذين يحضرون",
      ConstantStrings.search_name: "اسم البحث",
      ConstantStrings.search_relation: "ابحث عن علاقة",
      ConstantStrings.special_characters: "يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل وحرف صغير واحد ورقم واحد وحرف خاص واحد",

      ConstantStrings.invitation_member: "قم بدعوة الأعضاء",
      ConstantStrings.Added: "تمت دعوته",


      ConstantStrings.group_name: "اسم المجموعة",
      ConstantStrings.create_groups: "إنشاء مجموعة",
    },
    // Add more languages as needed
  };

  String get group_name {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.group_name]!;
  }

  String get creditsOffer {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.creditsOffer]!;
  }

  String get create_groups {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.create_groups]!;
  }


  String get invitation_member {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.invitation_member]!;
  }
  String get Added {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.Added]!;
  }


  String get search_relation {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.search_relation]!;
  }

  String get special_character {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.special_characters]!;
  }

  String get searchName {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.search_name]!;
  }
  String get events {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.events]!;
  }

  String get this_year {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.this_year]!;
  }

  String get this_month {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.this_month]!;
  }
  String get this_week {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.this_week]!;
  }

  String get date_selection {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.date_selection]!;
  }

  String get choose_an_occasion {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.choose_an_occasion]!;
  }

  String get popular_occasion {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.popular_occasion]!;
  }
  String get Memory {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.Memory]!;
  }
  String get add_contact {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.add_contact]!;
  }
  String get Gifts_for {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.Gifts_for]!;
  }
  String get add_your_gift {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.add_your_gift]!;
  }
  String get Memories {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.Memories]!;
  }
  String get View_All_Memories {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.View_All_Memories]!;
  }
  String get how_the_day_looking {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.how_the_day_looking]!;
  }
  String get select_time_slot {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.select_time_slot]!;
  }
  String get Add_Activity {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.Add_Activity]!;
  }
  String get Activity_Name {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.Activity_Name]!;
  }
  String get Activity_Loc {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.Activity_Loc]!;
  }
  String get Recommended_Activities {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.Recommended_Activities]!;
  }
  String get People_Attending {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.People_Attending]!;
  }

















  String get Occasion {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.Occasion]!;
  }
  String get occasion_for {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.occasion_for]!;
  }
  String get relationship {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.relationship]!;
  }
  String get date1 {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.date]!;
  }
  String get add_friends_or_groups {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.add_friends_or_groups]!;
  }
  String get occasion_preferences {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.occasion_preferences]!;
  }
  String get make_occasion {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.make_occasion]!;
  }




  String get select_option {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.select_option]!;
  }
  String get add_event {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.add_event]!;
  }
  String get create_group {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.create_group]!;
  }






  String get searchEvents {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.search_events]!;
  }

  String get bookmarked_occasion {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.bookmarked_occasion]!;
  }
  String get recommended {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.recommended]!;
  }
  String get add_to_my_occasion {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.add_to_my_occasion]!;
  }
  String get people {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.people]!;
  }
  String get description {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.description]!;
  }
  String get Activities {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.Activities]!;
  }





  String get orderStatus {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.OrderStatus]!;
  }

  String get backToHome {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.BackToHome]!;
  }
  String get date {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.Date]!;
  }
  String get orderPlaced {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.orderPlaced]!;
  }


  String get taxes {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.Taxes]!;
  }
  String get delivery {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.Delivery]!;
  }
  String get price {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.price]!;
  }
  String get orderSummary {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.OrderSummary]!;
  }
  String get AvailableWraps {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.AvailableWraps]!;
  }
  String get prefBased {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.PreferenceBased]!;
  }
  String get byPref {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.ByPreferences]!;
  }
  String get categories {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.Categories]!;
  }
  String get seeAll {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.seeAll]!;
  }

  String get productDetail {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.productDetail]!;
  }

  String get AddToOccasion {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.AddToOccasion]!;
  }
  String get SelectWrap {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.SelectWrap]!;
  }
  String get AddWrap {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.AddWrap]!;
  }
  String get searchWrap {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.searchWrap]!;
  }

  String get passWeek {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.password_week]!;
  }












  String get numberNotCorr {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.number_not_correct]!;
  }
  String get passCreated {
    return _localizedValues[locale.languageCode]![
    ConstantStrings.newPassCreated]!;
  }

  String get passDes {
    return _localizedValues[locale.languageCode]![ConstantStrings.passDes]!;
  }

  String get addToCart {
    return _localizedValues[locale.languageCode]![ConstantStrings.addToCart]!;
  }
  String get AddToCart {
    return _localizedValues[locale.languageCode]![ConstantStrings.AddToCart]!;
  }

  String get office {
    return _localizedValues[locale.languageCode]![ConstantStrings.Office]!;
  }

  String get delete {
    return _localizedValues[locale.languageCode]![ConstantStrings.delete]!;
  }

  String get defaultModel {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.defaultModel]!;
  }

  String get update {
    return _localizedValues[locale.languageCode]![ConstantStrings.update]!;
  }

  String get defTitle {
    return _localizedValues[locale.languageCode]![ConstantStrings.defTitle]!;
  }

  String get lightMode {
    return _localizedValues[locale.languageCode]![ConstantStrings.lightMode]!;
  }

  String get lightTitle {
    return _localizedValues[locale.languageCode]![ConstantStrings.lightTitle]!;
  }

  String get darkMode {
    return _localizedValues[locale.languageCode]![ConstantStrings.darkMode]!;
  }

  String get darkTitle {
    return _localizedValues[locale.languageCode]![ConstantStrings.darkTitle]!;
  }

  String get myRewards {
    return _localizedValues[locale.languageCode]![ConstantStrings.myRewards]!;
  }

  String get wallet {
    return _localizedValues[locale.languageCode]![ConstantStrings.wallet]!;
  }

  String get rewards {
    return _localizedValues[locale.languageCode]![ConstantStrings.rewards]!;
  }

  String get all {
    return _localizedValues[locale.languageCode]![ConstantStrings.all]!;
  }

  String get earned {
    return _localizedValues[locale.languageCode]![ConstantStrings.earned]!;
  }

  String get Redeemed {
    return _localizedValues[locale.languageCode]![ConstantStrings.Redeemed]!;
  }

  String get english {
    return _localizedValues[locale.languageCode]![ConstantStrings.english]!;
  }

  String get engTitle {
    return _localizedValues[locale.languageCode]![ConstantStrings.engTitle]!;
  }

  String get arabic {
    return _localizedValues[locale.languageCode]![ConstantStrings.arabic]!;
  }

  String get arabicTitle {
    return _localizedValues[locale.languageCode]![ConstantStrings.arabicTitle]!;
  }

  String get myWish {
    return _localizedValues[locale.languageCode]![ConstantStrings.myWish]!;
  }

  String get newWishlist {
    return _localizedValues[locale.languageCode]![ConstantStrings.newWishlist]!;
  }

  String get public {
    return _localizedValues[locale.languageCode]![ConstantStrings.public]!;
  }

  String get birthday {
    return _localizedValues[locale.languageCode]![ConstantStrings.birthday]!;
  }

  String get shareLink {
    return _localizedValues[locale.languageCode]![ConstantStrings.shareLink]!;
  }

  String get addFriend {
    return _localizedValues[locale.languageCode]![ConstantStrings.addFriend]!;
  }

  String get peopleJoined {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.peopleJoined]!;
  }

  String get general {
    return _localizedValues[locale.languageCode]![ConstantStrings.general]!;
  }

  String get Addresses {
    return _localizedValues[locale.languageCode]![ConstantStrings.Addresses]!;
  }

  String get addNew {
    return _localizedValues[locale.languageCode]![ConstantStrings.addNew]!;
  }

  String get addNewAddress {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.addNewAddress]!;
  }

  String get Add {
    return _localizedValues[locale.languageCode]![ConstantStrings.Add]!;
  }

  String get Save {
    return _localizedValues[locale.languageCode]![ConstantStrings.Save]!;
  }

  String get onHold {
    return _localizedValues[locale.languageCode]![ConstantStrings.onHold]!;
  }

  String get Cancelled {
    return _localizedValues[locale.languageCode]![ConstantStrings.Cancelled]!;
  }

  String get delivered {
    return _localizedValues[locale.languageCode]![ConstantStrings.delivered]!;
  }

  String get OrderDetails {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.OrderDetails]!;
  }

  String get itemSummary {
    return _localizedValues[locale.languageCode]![ConstantStrings.itemSummary]!;
  }

  String get addTrack {
    return _localizedValues[locale.languageCode]![ConstantStrings.addTrack]!;
  }

  String get Payment {
    return _localizedValues[locale.languageCode]![ConstantStrings.Payment]!;
  }

  String get Summary {
    return _localizedValues[locale.languageCode]![ConstantStrings.Summary]!;
  }

  String get SubTotalProducts {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.SubTotalProducts]!;
  }

  String get DeliveryFee {
    return _localizedValues[locale.languageCode]![ConstantStrings.DeliveryFee]!;
  }

  String get Tax {
    return _localizedValues[locale.languageCode]![ConstantStrings.Tax]!;
  }

  String get Total {
    return _localizedValues[locale.languageCode]![ConstantStrings.Total]!;
  }

  String get OR {
    return _localizedValues[locale.languageCode]![ConstantStrings.OR]!;
  }

  String get ShareLink {
    return _localizedValues[locale.languageCode]![ConstantStrings.ShareLink]!;
  }

  String get reviewCreate {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.reviewCreate]!;
  }

  String get overAll {
    return _localizedValues[locale.languageCode]![ConstantStrings.overAll]!;
  }

  String get addHeading {
    return _localizedValues[locale.languageCode]![ConstantStrings.addHeading]!;
  }

  String get addPic {
    return _localizedValues[locale.languageCode]![ConstantStrings.addPic]!;
  }

  String get addWritten {
    return _localizedValues[locale.languageCode]![ConstantStrings.addWritten]!;
  }

  String get dislike {
    return _localizedValues[locale.languageCode]![ConstantStrings.dislike]!;
  }

  String get Next {
    return _localizedValues[locale.languageCode]![ConstantStrings.Next]!;
  }

  String get Points {
    return _localizedValues[locale.languageCode]![ConstantStrings.Points]!;
  }

  String get Address {
    return _localizedValues[locale.languageCode]![ConstantStrings.Address]!;
  }

  String get city {
    return _localizedValues[locale.languageCode]![ConstantStrings.city]!;
  }

  String get floor {
    return _localizedValues[locale.languageCode]![ConstantStrings.floor]!;
  }

  String get Home {
    return _localizedValues[locale.languageCode]![ConstantStrings.Home]!;
  }

  String get Appartment {
    return _localizedValues[locale.languageCode]![ConstantStrings.Appartment]!;
  }

  String get Villa {
    return _localizedValues[locale.languageCode]![ConstantStrings.Villa]!;
  }

  String get Other {
    return _localizedValues[locale.languageCode]![ConstantStrings.Other]!;
  }

  String get account {
    return _localizedValues[locale.languageCode]![ConstantStrings.account]!;
  }

  String get appear {
    return _localizedValues[locale.languageCode]![ConstantStrings.appear]!;
  }

  String get reward {
    return _localizedValues[locale.languageCode]![ConstantStrings.reward]!;
  }

  String get language {
    return _localizedValues[locale.languageCode]![ConstantStrings.language]!;
  }

  String get invite {
    return _localizedValues[locale.languageCode]![ConstantStrings.invite]!;
  }

  String get orderHis {
    return _localizedValues[locale.languageCode]![ConstantStrings.orderHis]!;
  }

  String get wishList {
    return _localizedValues[locale.languageCode]![ConstantStrings.wishList]!;
  }

  String get address {
    return _localizedValues[locale.languageCode]![ConstantStrings.address]!;
  }

  String get menues {
    return _localizedValues[locale.languageCode]![ConstantStrings.menues]!;
  }

  String get logout {
    return _localizedValues[locale.languageCode]![ConstantStrings.logout]!;
  }

  String get logout_confir_title {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.logout_confirmation_title]!;
  }

  String get logout_confirmation_description {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.logout_confirmation_description]!;
  }

  String get occ_text {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.occasions_text]!;
  }

  String get exp_for {
    return _localizedValues[locale.languageCode]![ConstantStrings.explore_for]!;
  }

  String get exp_occ {
    return _localizedValues[locale.languageCode]![ConstantStrings.explore_occ]!;
  }

  String get no_personal {
    return _localizedValues[locale.languageCode]![ConstantStrings.no_personal]!;
  }

  String get add_occ {
    return _localizedValues[locale.languageCode]![ConstantStrings.add_occ]!;
  }

  String get plan_surprise {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.plan_suprise_des]!;
  }

  String get searchOcc {
    return _localizedValues[locale.languageCode]![ConstantStrings.search_occ]!;
  }

  String get select {
    return _localizedValues[locale.languageCode]![ConstantStrings.select]!;
  }

  String get cancel {
    return _localizedValues[locale.languageCode]![ConstantStrings.cancel]!;
  }

  String get giftFor {
    return _localizedValues[locale.languageCode]![ConstantStrings.giftFor]!;
  }

  String get byLoc {
    return _localizedValues[locale.languageCode]![ConstantStrings.byLocation]!;
  }

  String get byOcc {
    return _localizedValues[locale.languageCode]![ConstantStrings.byOccasion]!;
  }

  String get selectOcc {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.selectOccasion]!;
  }

  String get byDate {
    return _localizedValues[locale.languageCode]![ConstantStrings.byDate]!;
  }

  String get selectDate {
    return _localizedValues[locale.languageCode]![ConstantStrings.selectDate]!;
  }

  String get byBudg {
    return _localizedValues[locale.languageCode]![ConstantStrings.byBudget]!;
  }

  String get filters {
    return _localizedValues[locale.languageCode]![ConstantStrings.filters]!;
  }

  String get resultFor {
    return _localizedValues[locale.languageCode]![ConstantStrings.resultFor]!;
  }

  String get onboardingTitle {
    return _localizedValues[locale.languageCode]![ConstantStrings.title1]!;
  }

  String get onboardingTitle1 {
    return _localizedValues[locale.languageCode]![ConstantStrings.title2]!;
  }

  String get onboardingTitle2 {
    return _localizedValues[locale.languageCode]![ConstantStrings.title3]!;
  }

  String get onboardingSubTitle1 {
    return _localizedValues[locale.languageCode]![ConstantStrings.subTitle1]!;
  }

  String get onboardingSubTitle2 {
    return _localizedValues[locale.languageCode]![ConstantStrings.subTitle2]!;
  }

  String get onboardingSubTitle3 {
    return _localizedValues[locale.languageCode]![ConstantStrings.subTitle3]!;
  }

  String get getTitleType {
    return _localizedValues[locale.languageCode]![ConstantStrings.title_type]!;
  }

  String get signupType {
    return _localizedValues[locale.languageCode]![ConstantStrings.signup]!;
  }

  String get googleType {
    return _localizedValues[locale.languageCode]![ConstantStrings.google]!;
  }

  String get facebookType {
    return _localizedValues[locale.languageCode]![ConstantStrings.facebook]!;
  }

  String get appleType {
    return _localizedValues[locale.languageCode]![ConstantStrings.apple]!;
  }

  String get signInType {
    return _localizedValues[locale.languageCode]![ConstantStrings.signIn]!;
  }

  String get letExplore {
    return _localizedValues[locale.languageCode]![ConstantStrings.let_explore]!;
  }

  String get next_btn {
    return _localizedValues[locale.languageCode]![ConstantStrings.next]!;
  }

  String get buy_send {
    return _localizedValues[locale.languageCode]![ConstantStrings.buy_send]!;
  }

  String get top_city {
    return _localizedValues[locale.languageCode]![ConstantStrings.top_city]!;
  }

  String get all_city_country {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.all_city_country]!;
  }

  String get search_city_of {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.search_city_of]!;
  }

  String get search_city {
    return _localizedValues[locale.languageCode]![ConstantStrings.search_city]!;
  }

  String get prefrence {
    return _localizedValues[locale.languageCode]![ConstantStrings.prefrence]!;
  }

  String get select_pref {
    return _localizedValues[locale.languageCode]![ConstantStrings.select_pref]!;
  }

  String get select_min_pref {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.select_min_pref]!;
  }

  String get noRecordFound {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.noRecordFound]!;
  }

  String get enterEmail {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.enter_email_mobile]!;
  }

  String get enterPassword {
    return _localizedValues[locale.languageCode]![ConstantStrings.enter_pass]!;
  }

  String get enterCorrect {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.correct_email]!;
  }

  String get forgetPass {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.forget_password]!;
  }

  String get dontHaveAccount {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.dont_have_account]!;
  }

  String get signup {
    return _localizedValues[locale.languageCode]![ConstantStrings.signup]!;
  }

  String get signIn {
    return _localizedValues[locale.languageCode]![ConstantStrings.signIn]!;
  }

  String get signUp {
    return _localizedValues[locale.languageCode]![ConstantStrings.sign_Up]!;
  }

  String get firstName {
    return _localizedValues[locale.languageCode]![ConstantStrings.first_name]!;
  }

  String get lastName {
    return _localizedValues[locale.languageCode]![ConstantStrings.last_name]!;
  }

  String get number {
    return _localizedValues[locale.languageCode]![ConstantStrings.number]!;
  }

  String get email {
    return _localizedValues[locale.languageCode]![ConstantStrings.email]!;
  }

  String get already {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.already_have_account]!;
  }

  String get passwordMust {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.password_must_be_characters]!;
  }

  String get signin {
    return _localizedValues[locale.languageCode]![ConstantStrings.signin]!;
  }

  String get verification {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.verification]!;
  }

  String get verifyOtp {
    return _localizedValues[locale.languageCode]![ConstantStrings.verify_otp]!;
  }

  String get verify {
    return _localizedValues[locale.languageCode]![ConstantStrings.verify]!;
  }

  String get getSms {
    return _localizedValues[locale.languageCode]![ConstantStrings.get_sms]!;
  }

  String get sendCode {
    return _localizedValues[locale.languageCode]![ConstantStrings.send_code]!;
  }

  String get otpSend {
    return _localizedValues[locale.languageCode]![ConstantStrings.otp_send]!;
  }

  String get enterCode {
    return _localizedValues[locale.languageCode]![ConstantStrings.enter_code]!;
  }

  String get forget {
    return _localizedValues[locale.languageCode]![ConstantStrings.forget]!;
  }

  String get password {
    return _localizedValues[locale.languageCode]![ConstantStrings.password]!;
  }

  String get enetr_your_email {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.enter_your_email]!;
  }

  String get enter_register {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.enter_register_email]!;
  }

  String get reset_pass {
    return _localizedValues[locale.languageCode]![ConstantStrings.reset_pass]!;
  }

  String get createPass {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.create_new_pass]!;
  }

  String get doNotMATCH {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.do_not_match]!;
  }

  String get confirmPass {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.confirm_password]!;
  }

  String get titleType {
    return _localizedValues[locale.languageCode]![ConstantStrings.title_type]!;
  }

  String get titleType1 {
    return _localizedValues[locale.languageCode]![ConstantStrings.title_type1]!;
  }

  String get home {
    return _localizedValues[locale.languageCode]![ConstantStrings.home]!;
  }

  String get menu {
    return _localizedValues[locale.languageCode]![ConstantStrings.menu]!;
  }

  String get explore {
    return _localizedValues[locale.languageCode]![ConstantStrings.explore]!;
  }

  String get occ {
    return _localizedValues[locale.languageCode]![ConstantStrings.occasions]!;
  }

  String get allOcc {
    return _localizedValues[locale.languageCode]![ConstantStrings.all_occ]!;
  }

  String get searchGift {
    return _localizedValues[locale.languageCode]![ConstantStrings.search_gift]!;
  }

  String get topCat {
    return _localizedValues[locale.languageCode]![ConstantStrings.top_cat]!;
  }

  String get viewAll {
    return _localizedValues[locale.languageCode]![ConstantStrings.view_all]!;
  }

  String get topGift {
    return _localizedValues[locale.languageCode]![ConstantStrings.top_gift]!;
  }

  String get bestGift {
    return _localizedValues[locale.languageCode]![ConstantStrings.best_gift]!;
  }

  String get trendingOcc {
    return _localizedValues[locale.languageCode]![ConstantStrings.trend_occ]!;
  }

  String get customize {
    return _localizedValues[locale.languageCode]![ConstantStrings.customize]!;
  }

  String get topSeller {
    return _localizedValues[locale.languageCode]![ConstantStrings.top_seller]!;
  }

  String get nearBy {
    return _localizedValues[locale.languageCode]![ConstantStrings.near_by]!;
  }

  String get accountHasBeen {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.account_has_been]!;
  }

  String get createdSucessfully {
    return _localizedValues[locale.languageCode]![
        ConstantStrings.created_sucessfully]!;
  }

  String get explores {
    return _localizedValues[locale.languageCode]![ConstantStrings.explores]!;
  }

  String get des {
    return _localizedValues[locale.languageCode]![ConstantStrings.des]!;
  }

  String get skip {
    return _localizedValues[locale.languageCode]![ConstantStrings.skip]!;
  }

  String get yes {
    return _localizedValues[locale.languageCode]![ConstantStrings.yes]!;
  }

  String get no {
    return _localizedValues[locale.languageCode]![ConstantStrings.no]!;
  }
  String get cart {
    return _localizedValues[locale.languageCode]![ConstantStrings.cart]!;
  }
  String get VisaCard {
    return _localizedValues[locale.languageCode]![ConstantStrings.VisaCard]!;
  }
  String get masterCard {
    return _localizedValues[locale.languageCode]![ConstantStrings.masterCard]!;
  }
  String get shareLinkAddress {
    return _localizedValues[locale.languageCode]![ConstantStrings.shareLinkAddress]!;
  }
  String get addNewCard {
    return _localizedValues[locale.languageCode]![ConstantStrings.addNewCard]!;
  }
  String get paymentCard {
    return _localizedValues[locale.languageCode]![ConstantStrings.paymentCard]!;
  }
  String get wishlist {
    return _localizedValues[locale.languageCode]![ConstantStrings.wishlist]!;
  }
  String get addItem {
    return _localizedValues[locale.languageCode]![ConstantStrings.addItem]!;
  }
  String get itemInCart {
    return _localizedValues[locale.languageCode]![ConstantStrings.itemInCart]!;
  }
  String get yourCart {
    return _localizedValues[locale.languageCode]![ConstantStrings.yourCart]!;
  }
  String get buyItemTogether {
    return _localizedValues[locale.languageCode]![ConstantStrings.buyItemTogether]!;
  }
  String get weReceived {
    return _localizedValues[locale.languageCode]![ConstantStrings.weReceived]!;
  }
  String get boughtTogether {
    return _localizedValues[locale.languageCode]![ConstantStrings.boughtTogether]!;
  }
  String get CartTotal {
    return _localizedValues[locale.languageCode]![ConstantStrings.CartTotal]!;
  }
  String get checkout {
    return _localizedValues[locale.languageCode]![ConstantStrings.checkout]!;
  }  String get ContinueShopping {
    return _localizedValues[locale.languageCode]![ConstantStrings.ContinueShopping]!;
  }
  String get trackOrder {
    return _localizedValues[locale.languageCode]![ConstantStrings.trackOrder]!;
  }
  String get confirmOrder {
    return _localizedValues[locale.languageCode]![ConstantStrings.confirmOrder]!;
  }  String get thankYou {
    return _localizedValues[locale.languageCode]![ConstantStrings.thankYou]!;
  }
  String get total {
    return _localizedValues[locale.languageCode]![ConstantStrings.total]!;
  }
  String get deliveryFee {
    return _localizedValues[locale.languageCode]![ConstantStrings.deliveryFee]!;
  }
  String get subTotal {
    return _localizedValues[locale.languageCode]![ConstantStrings.subTotal]!;
  }
  String get items {
    return _localizedValues[locale.languageCode]![ConstantStrings.items]!;
  }














}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
