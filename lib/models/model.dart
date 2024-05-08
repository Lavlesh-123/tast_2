class UserModel {
    Name name;
    List<String>? tld;
    String cca2;
    String? ccn3;
    String cca3;
    String? cioc;
    bool? independent;
    Status status;
    bool unMember;
    Currencies? currencies;
    Idd idd;
    List<String>? capital;
    List<String> altSpellings;
    Region region;
    String? subregion;
    Map<String, String>? languages;
    Map<String, Translation> translations;
    List<double> latlng;
    bool landlocked;
    List<String>? borders;
    double area;
    Demonyms? demonyms;
    String flag;
    Maps maps;
    int population;
    Map<String, double>? gini;
    String? fifa;
    Car car;
    List<String> timezones;
    List<Continent> continents;
    Flags flags;
    CoatOfArms coatOfArms;
    StartOfWeek startOfWeek;
    CapitalInfo capitalInfo;
    PostalCode? postalCode;

    UserModel({
        required this.name,
        this.tld,
        required this.cca2,
        this.ccn3,
        required this.cca3,
        this.cioc,
        this.independent,
        required this.status,
        required this.unMember,
        this.currencies,
        required this.idd,
        this.capital,
        required this.altSpellings,
        required this.region,
        this.subregion,
        this.languages,
        required this.translations,
        required this.latlng,
        required this.landlocked,
        this.borders,
        required this.area,
        this.demonyms,
        required this.flag,
        required this.maps,
        required this.population,
        this.gini,
        this.fifa,
        required this.car,
        required this.timezones,
        required this.continents,
        required this.flags,
        required this.coatOfArms,
        required this.startOfWeek,
        required this.capitalInfo,
        this.postalCode,
    });
 
}

class CapitalInfo {
    List<double>? latlng;

    CapitalInfo({
        this.latlng,
    });

}

class Car {
    List<String>? signs;
    Side side;

    Car({
        this.signs,
        required this.side,
    });

}

enum Side {
    LEFT,
    RIGHT
}

class CoatOfArms {
    String? png;
    String? svg;

    CoatOfArms({
        this.png,
        this.svg,
    });

}

enum Continent {
    AFRICA,
    ANTARCTICA,
    ASIA,
    EUROPE,
    NORTH_AMERICA,
    OCEANIA,
    SOUTH_AMERICA
}

class Currencies {
    Aed? mdl;
    Aed? usd;
    Aed? eur;
    Aed? aud;
    Aed? mzn;
    Aed? brl;
    Aed? cve;
    Aed? xaf;
    Aed? all;
    Aed? nzd;
    Aed? ngn;
    Aed? gmd;
    Aed? sos;
    Aed? yer;
    Aed? myr;
    Aed? xcd;
    Aed? gbp;
    Aed? mga;
    Aed? dzd;
    Aed? mad;
    Aed? mru;
    Aed? pyg;
    Aed? lkr;
    Aed? zar;
    Aed? kwd;
    Aed? sll;
    Aed? rwf;
    Aed? syp;
    Aed? hnl;
    Aed? jod;
    Aed? tvd;
    Aed? npr;
    Aed? lrd;
    Aed? ggp;
    Aed? djf;
    Aed? fjd;
    Aed? nok;
    Aed? fkp;
    Aed? kzt;
    Aed? tmt;
    Aed? bgn;
    Aed? xpf;
    Aed? bbd;
    Aed? stn;
    Aed? bnd;
    Aed? sgd;
    Aed? btn;
    Aed? inr;
    Aed? ars;
    Aed? azn;
    Aed? mxn;
    Aed? gtq;
    Aed? kes;
    Aed? czk;
    Aed? gip;
    Aed? awg;
    Aed? aed;
    Aed? ssp;
    Aed? xof;
    Aed? shp;
    Aed? bwp;
    Aed? uzs;
    Aed? tnd;
    Aed? hkd;
    Aed? mkd;
    Aed? srd;
    Aed? sbd;
    Aed? uah;
    Bam? bam;
    Aed? irr;
    Aed? cuc;
    Aed? cup;
    Aed? ern;
    Aed? currenciesTry;
    Aed? php;
    Aed? vuv;
    Aed? bob;
    Aed? ron;
    Aed? khr;
    Aed? zwl;
    Aed? jep;
    Aed? kgs;
    Aed? gyd;
    Aed? amd;
    Aed? lbp;
    Aed? dkk;
    Aed? pgk;
    Aed? zmw;
    Aed? ttd;
    Aed? pen;
    Aed? sek;
    Bam? sdg;
    Aed? omr;
    Aed? twd;
    Aed? mnt;
    Aed? tzs;
    Aed? cad;
    Aed? crc;
    Aed? cny;
    Aed? cop;
    Aed? mmk;
    Aed? rub;
    Aed? kpw;
    Aed? kyd;
    Aed? byn;
    Aed? szl;
    Aed? pln;
    Aed? chf;
    Aed? ves;
    Aed? pab;
    Aed? wst;
    Aed? fok;
    Aed? thb;
    Aed? bsd;
    Aed? top;
    Aed? bif;
    Aed? bhd;
    Aed? imp;
    Aed? htg;
    Aed? afn;
    Aed? ils;
    Aed? lyd;
    Aed? uyu;
    Aed? nio;
    Aed? ckd;
    Aed? lak;
    Aed? kid;
    Aed? ang;
    Aed? jmd;
    Aed? egp;
    Aed? clp;
    Aed? lsl;
    Aed? ghs;
    Aed? scr;
    Aed? aoa;
    Aed? bmd;
    Aed? pkr;
    Aed? sar;
    Aed? krw;
    Aed? etb;
    Aed? bdt;
    Aed? kmf;
    Aed? bzd;
    Aed? ugx;
    Aed? huf;
    Aed? isk;
    Aed? tjs;
    Aed? nad;
    Aed? rsd;
    Aed? mur;
    Aed? mop;
    Aed? mvr;
    Aed? idr;
    Aed? cdf;
    Aed? vnd;
    Aed? gnf;
    Aed? gel;
    Aed? mwk;
    Aed? iqd;
    Aed? jpy;
    Aed? dop;
    Aed? qar;

    Currencies({
        this.mdl,
        this.usd,
        this.eur,
        this.aud,
        this.mzn,
        this.brl,
        this.cve,
        this.xaf,
        this.all,
        this.nzd,
        this.ngn,
        this.gmd,
        this.sos,
        this.yer,
        this.myr,
        this.xcd,
        this.gbp,
        this.mga,
        this.dzd,
        this.mad,
        this.mru,
        this.pyg,
        this.lkr,
        this.zar,
        this.kwd,
        this.sll,
        this.rwf,
        this.syp,
        this.hnl,
        this.jod,
        this.tvd,
        this.npr,
        this.lrd,
        this.ggp,
        this.djf,
        this.fjd,
        this.nok,
        this.fkp,
        this.kzt,
        this.tmt,
        this.bgn,
        this.xpf,
        this.bbd,
        this.stn,
        this.bnd,
        this.sgd,
        this.btn,
        this.inr,
        this.ars,
        this.azn,
        this.mxn,
        this.gtq,
        this.kes,
        this.czk,
        this.gip,
        this.awg,
        this.aed,
        this.ssp,
        this.xof,
        this.shp,
        this.bwp,
        this.uzs,
        this.tnd,
        this.hkd,
        this.mkd,
        this.srd,
        this.sbd,
        this.uah,
        this.bam,
        this.irr,
        this.cuc,
        this.cup,
        this.ern,
        this.currenciesTry,
        this.php,
        this.vuv,
        this.bob,
        this.ron,
        this.khr,
        this.zwl,
        this.jep,
        this.kgs,
        this.gyd,
        this.amd,
        this.lbp,
        this.dkk,
        this.pgk,
        this.zmw,
        this.ttd,
        this.pen,
        this.sek,
        this.sdg,
        this.omr,
        this.twd,
        this.mnt,
        this.tzs,
        this.cad,
        this.crc,
        this.cny,
        this.cop,
        this.mmk,
        this.rub,
        this.kpw,
        this.kyd,
        this.byn,
        this.szl,
        this.pln,
        this.chf,
        this.ves,
        this.pab,
        this.wst,
        this.fok,
        this.thb,
        this.bsd,
        this.top,
        this.bif,
        this.bhd,
        this.imp,
        this.htg,
        this.afn,
        this.ils,
        this.lyd,
        this.uyu,
        this.nio,
        this.ckd,
        this.lak,
        this.kid,
        this.ang,
        this.jmd,
        this.egp,
        this.clp,
        this.lsl,
        this.ghs,
        this.scr,
        this.aoa,
        this.bmd,
        this.pkr,
        this.sar,
        this.krw,
        this.etb,
        this.bdt,
        this.kmf,
        this.bzd,
        this.ugx,
        this.huf,
        this.isk,
        this.tjs,
        this.nad,
        this.rsd,
        this.mur,
        this.mop,
        this.mvr,
        this.idr,
        this.cdf,
        this.vnd,
        this.gnf,
        this.gel,
        this.mwk,
        this.iqd,
        this.jpy,
        this.dop,
        this.qar,
    });

}

class Aed {
    String name;
    String symbol;

    Aed({
        required this.name,
        required this.symbol,
    });

}

class Bam {
    String name;

    Bam({
        required this.name,
    });

}

class Demonyms {
    Eng eng;
    Eng? fra;

    Demonyms({
        required this.eng,
        this.fra,
    });

}

class Eng {
    String f;
    String m;

    Eng({
        required this.f,
        required this.m,
    });

}

class Flags {
    String png;
    String svg;
    String? alt;

    Flags({
        required this.png,
        required this.svg,
        this.alt,
    });

}

class Idd {
    String? root;
    List<String>? suffixes;

    Idd({
        this.root,
        this.suffixes,
    });

}

class Maps {
    String googleMaps;
    String openStreetMaps;

    Maps({
        required this.googleMaps,
        required this.openStreetMaps,
    });

}

class Name {
    String common;
    String official;
    Map<String, Translation>? nativeName;

    Name({
        required this.common,
        required this.official,
        this.nativeName,
    });

}

class Translation {
    String official;
    String common;

    Translation({
        required this.official,
        required this.common,
    });

}

class PostalCode {
    String format;
    String? regex;

    PostalCode({
        required this.format,
        this.regex,
    });

}

enum Region {
    AFRICA,
    AMERICAS,
    ANTARCTIC,
    ASIA,
    EUROPE,
    OCEANIA
}

enum StartOfWeek {
    MONDAY,
    SATURDAY,
    SUNDAY
}

enum Status {
    OFFICIALLY_ASSIGNED,
    USER_ASSIGNED
}
